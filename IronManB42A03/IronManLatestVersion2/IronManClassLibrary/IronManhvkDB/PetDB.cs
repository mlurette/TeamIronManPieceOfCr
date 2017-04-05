using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using System.ComponentModel;

namespace IronManhvkDB
{
    public class PetDB
    {
        public DataSet listPetsDB(int ownerNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"select pet_number, pet_name, pet_gender, pet_fixed, pet_breed, pet_birthdate, dog_size, special_notes from hvk_pet where own_owner_number = :ownerNum order by pet_name";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("ownerNum", ownerNum);

            DataSet ds = new DataSet("deptDataSet");

            da.Fill(ds, "hvk_pet");
            return ds;
        }

        public DataSet getPetOwnerDB(int petNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @" SELECT P.OWN_OWNER_NUMBER FROM HVK_PET P WHERE P.PET_NUMBER = :petNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petNum", petNum);

            DataSet ds = new DataSet("deptDataSet");

            da.Fill(ds, "hvk_pet");
            return ds;
        }

        public DataSet getPetSizeDB(int petNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @" select DOG_SIZE from hvk_pet p where p.PET_NUMBER = :petNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petNum", petNum);

            DataSet ds = new DataSet("deptDataSet");

            da.Fill(ds, "hvk_pet");
            return ds;

        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]

        public DataSet getPetsByOwnerDB(int ownerNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT P.PET_NUMBER,
  P.PET_NAME,
  P.PET_GENDER,
  P.PET_FIXED,
  P.PET_BREED,
  P.PET_BIRTHDATE,
  P.OWN_OWNER_NUMBER,
  P.DOG_SIZE,
  P.SPECIAL_NOTES
FROM HVK_PET P
WHERE P.OWN_OWNER_NUMBER = :ownerNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("ownerNum", ownerNum);
            DataSet ds = new DataSet("Pet");
            da.Fill(ds, "HVKPET");

            return ds;
        }

        public DataSet getPetGenderDB(int petNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT
  P.PET_GENDER
FROM HVK_PET P
WHERE P.PET_NUMBER = :petNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petNum", petNum);
            DataSet ds = new DataSet("Pet");
            da.Fill(ds, "HVKPET");

            return ds;
        }

        public DataSet getPetFixedDB(int petNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT
  P.PET_FIXED
FROM HVK_PET P
WHERE P.PET_NUMBER = :petNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petNum", petNum);
            DataSet ds = new DataSet("Pet");
            da.Fill(ds, "HVKPET");

            return ds;
        }

        public DataSet getPetsByReservationDB(int resNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT P.PET_NAME FROM HVK_PET P
INNER JOIN HVK_PET_RESERVATION PR
ON PR.PET_PET_NUMBER = P.PET_NUMBER
WHERE PR.RES_RESERVATION_NUMBER = :resNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("resNum", resNum);
            DataSet ds = new DataSet("Pet");
            da.Fill(ds, "HVKPET");

            return ds;
            
        }



    }
}
