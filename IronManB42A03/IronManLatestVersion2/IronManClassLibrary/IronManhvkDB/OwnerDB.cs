using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using System.ComponentModel;

namespace IronManhvkDB
{
    public class OwnerDB
    {

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet listOwnersDB()
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT O.OWNER_NUMBER,
  O.OWNER_FIRST_NAME,
  O.OWNER_LAST_NAME,
  O.OWNER_STREET,
  O.OWNER_CITY,
  O.OWNER_PROVINCE,
  O.OWNER_POSTAL_CODE,
  O.OWNER_PHONE,
  O.OWNER_EMAIL,
  O.EMERGENCY_CONTACT_FIRST_NAME,
  O.EMERGENCY_CONTACT_LAST_NAME,
  O.EMERGENCY_CONTACT_PHONE
FROM HVK_OWNER O
ORDER BY O.OWNER_LAST_NAME";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;

            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Update, true)]
        public void updateOwnerDB(int ownerNum, String first, String last, String street, String city, String prov, String postal, String phone, String email, String emergFirst, String emergLast, String emergPhone)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"UPDATE HVK_OWNER O 
SET
  O.OWNER_FIRST_NAME = :first,
  O.OWNER_LAST_NAME = :last,
  O.OWNER_STREET = :street,
  O.OWNER_CITY = :city,
  O.OWNER_PROVINCE = :prov,
  O.OWNER_POSTAL_CODE = :postal,
  O.OWNER_PHONE = :phone,
  O.OWNER_EMAIL = :email,
  O.EMERGENCY_CONTACT_FIRST_NAME = :emergFirst,
  O.EMERGENCY_CONTACT_LAST_NAME = :emergLast,
  O.EMERGENCY_CONTACT_PHONE = :emergPhone
WHERE O.OWNER_NUMBER = :ownerNum";

            OracleCommand cmd = new OracleCommand(cmdStr, con);

            cmd.Parameters.Add("ownerNum", ownerNum);
            cmd.Parameters.Add("first", first);
            cmd.Parameters.Add("last", last);
            cmd.Parameters.Add("street", street);
            cmd.Parameters.Add("city", city);
            cmd.Parameters.Add("prov", prov);
            cmd.Parameters.Add("postal", postal);
            cmd.Parameters.Add("phone", phone);
            cmd.Parameters.Add("email", email);
            cmd.Parameters.Add("emergFirst", emergFirst);
            cmd.Parameters.Add("emergLast", emergLast);
            cmd.Parameters.Add("emergPhone", emergPhone);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.UpdateCommand = cmd;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                Console.WriteLine("Did not work");
            }
            finally
            {
                con.Close();
            }
        }
    }
}
