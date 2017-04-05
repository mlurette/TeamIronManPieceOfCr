using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;

namespace IronManhvkDB
{
    public class UserDB
    {
        [DataObjectMethod(DataObjectMethodType.Select, true)]

        public DataSet getOwnerByEmailDB(String email)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT O.OWNER_NUMBER,
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
WHERE O.OWNER_EMAIL = :email";
            OracleCommand cmd = new OracleCommand(cmdStr, con);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("email", email);
            DataSet ds = new DataSet("OWner");
            da.Fill(ds, "HVKOWNER");

            return ds;
        }
    }
}
