using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace IronManhvkDB
{
    public class PetReservationDB
    {

        public DataSet checkConflictingReservationDB(int petNum, DateTime start, DateTime end)
        {
            String startDate = start.ToString("dd-MMM-yyyy");
            String endDate = end.ToString("dd-MMM-yyyy");
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @" SELECT r.reservation_number
  FROM hvk_reservation r,
    hvk_pet_reservation pres
  WHERE (to_date(:startDate, 'DD-MON-YY') BETWEEN r.RESERVATION_START_DATE AND r.RESERVATION_END_DATE
  OR to_date(:endDate, 'DD-MON-YY') BETWEEN r.RESERVATION_START_DATE AND r.RESERVATION_END_DATE)
  AND pres.PET_PET_NUMBER =
    :petNum
  AND r.RESERVATION_NUMBER = pres.RES_RESERVATION_NUMBER";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("startDate", startDate);
            cmd.Parameters.Add("endDate", endDate);
            cmd.Parameters.Add("petNum", petNum);

            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }

        public void addToReservationDB(int petNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @" insert into
HVK_PET_RESERVATION(
PET_RES_NUMBER,
PET_PET_NUMBER,
RES_RESERVATION_NUMBER
)
VALUES(
HVK_PET_RES_SEQ.NEXTVAL,
:petNum,
HVK_RESERVATION_SEQ.CURRVAL
)";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            cmd.Parameters.Add("petNum", petNum);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.InsertCommand = cmd;

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

        public DataSet getPetReservationDB(int petRes)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT PR.PET_RES_NUMBER, PR.PET_PET_NUMBER, PR.RES_RESERVATION_NUMBER
FROM HVK_PET_RESERVATION PR
WHERE PR.PET_RES_NUMBER = :petRes";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petRes", petRes);

            DataSet ds = new DataSet("resDataSet");
            da.Fill(ds, "hvk_petreservation");


            return ds;
        }

        public DataSet getSinglePetReservationDB(int petNum, int resNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT PR.PET_RES_NUMBER, PR.PET_PET_NUMBER, PR.RES_RESERVATION_NUMBER
FROM HVK_PET_RESERVATION PR
WHERE PR.PET_PET_NUMBER = :petNum AND PR.RES_RESERVATION_NUMBER = :resNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petNum", petNum);
            cmd.Parameters.Add("resNum", resNum);
            DataSet ds = new DataSet("resDataSet");
            da.Fill(ds, "hvk_petreservation");

            return ds;
        }

        public DataSet getAllPetReservationsDB(int resNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT PR.PET_RES_NUMBER, PR.PET_PET_NUMBER, PR.RES_RESERVATION_NUMBER
FROM HVK_PET_RESERVATION PR
WHERE PR.RES_RESERVATION_NUMBER = :resNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("resNum", resNum);
            DataSet ds = new DataSet("resDataSet");
            da.Fill(ds, "hvk_petreservation");

            return ds;
        }

        public void insertPetReservationDB(int petNum, int runNum)
        {


            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"insert into
HVK_PET_RESERVATION(
PET_RES_NUMBER,
PET_PET_NUMBER,
RES_RESERVATION_NUMBER,
RUN_RUN_NUMBER
)
VALUES(
HVK_PET_RES_SEQ.NEXTVAL,
:petNum,
HVK_RESERVATION_SEQ.CURRVAL,
:runNum
)";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            cmd.Parameters.Add("petNum", petNum);
            cmd.Parameters.Add("runNum", runNum);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.InsertCommand = cmd;
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

        public DataSet getPetReservationServiceDB(int petRes)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT PRS.SERV_SERVICE_NUMBER, PRS.PR_PET_RES_NUMBER
FROM HVK_PET_RESERVATION_SERVICE PRS
WHERE PRS.PR_PET_RES_NUMBER = :petRes";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petRes", petRes);

            DataSet ds = new DataSet("resDataSet");
            da.Fill(ds, "hvk_petreservation");


            return ds;
        }

        public void insertPetReservationServiceDB(int serviceNum)
        {


            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"insert into
HVK_PET_RESERVATION_SERVICE(
SERVICE_FREQUENCY,
PR_PET_RES_NUMBER,
SERV_SERVICE_NUMBER
)
values(
null,
HVK_PET_RES_SEQ.CURRVAL,
:serviceNum
)";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            cmd.Parameters.Add("serviceNum", serviceNum);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.InsertCommand = cmd;

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

        public void addToReservationDB(int petNum, int resNum)
        {


            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @" insert into
HVK_PET_RESERVATION(
PET_RES_NUMBER,
PET_PET_NUMBER,
RES_RESERVATION_NUMBER
)
VALUES(
HVK_PET_RES_SEQ.NEXTVAL,
:petNum,
:resNUM
)";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            cmd.Parameters.Add("petNum", petNum);
            cmd.Parameters.Add("resNum", resNum);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.InsertCommand = cmd;
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
