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
    public class ReservationDB
    {

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet listReservationsDB(int ownerNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"select res.reservation_number, 
pres.pet_pet_number, pet.pet_name, 
res.reservation_start_date, 
res.reservation_end_date 
from hvk_reservation res, hvk_pet_reservation pres, hvk_pet pet
where pet.own_owner_number = :ownerNum 
and pet.pet_number = pres.pet_pet_number 
and pres.res_reservation_number = res.reservation_number
order by res.reservation_number";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("ownerNum", ownerNum);

            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }


        public DataSet getFullReservationDetails(int ownerNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"select res.reservation_number, 
pres.pet_pet_number, pet.pet_name, 
res.reservation_start_date, 
res.reservation_end_date 
from hvk_reservation res, hvk_pet_reservation pres, hvk_pet pet
where pet.own_owner_number = :ownerNum 
and pet.pet_number = pres.pet_pet_number 
and pres.res_reservation_number = res.reservation_number
order by res.reservation_number";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("ownerNum", ownerNum);

            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }
        //TESTED
        public DataSet listActiveReservationsDB(int ownerNum, DateTime startDate, DateTime endDate)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT R.RESERVATION_NUMBER, O.OWNER_FIRST_NAME, O.OWNER_LAST_NAME, PR.PET_PET_NUMBER,
P.PET_NAME, R.RESERVATION_START_DATE, R.RESERVATION_END_DATE, PR.RUN_RUN_NUMBER
FROM HVK_PET_RESERVATION PR
INNER JOIN HVK_RESERVATION R
ON R.RESERVATION_NUMBER = PR.RES_RESERVATION_NUMBER
INNER JOIN HVK_PET P
ON P.PET_NUMBER = PR.PET_PET_NUMBER
INNER JOIN HVK_OWNER O
ON O.OWNER_NUMBER = P.OWN_OWNER_NUMBER
WHERE O.OWNER_NUMBER = :ownerNum
AND R.RESERVATION_START_DATE  <= :startDate
AND R.RESERVATION_END_DATE >= :endDate";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("ownerNum", ownerNum);
            cmd.Parameters.Add("startDate", startDate);
            cmd.Parameters.Add("endDate", endDate);
            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }

     
        public DataSet listActiveReservationsDB(DateTime startDate, DateTime endDate)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT R.RESERVATION_NUMBER, O.OWNER_FIRST_NAME, O.OWNER_LAST_NAME, PR.PET_PET_NUMBER,
P.PET_NAME, R.RESERVATION_START_DATE, R.RESERVATION_END_DATE, PR.RUN_RUN_NUMBER
FROM HVK_PET_RESERVATION PR
INNER JOIN HVK_RESERVATION R
ON R.RESERVATION_NUMBER = PR.RES_RESERVATION_NUMBER
INNER JOIN HVK_PET P
ON P.PET_NUMBER = PR.PET_PET_NUMBER
INNER JOIN HVK_OWNER O
ON O.OWNER_NUMBER = P.OWN_OWNER_NUMBER
WHERE R.RESERVATION_START_DATE  <= :startDate
AND R.RESERVATION_END_DATE >= :endDate";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("startDate", startDate);
            cmd.Parameters.Add("endDate", endDate);

            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }

      
        public DataSet upcomingReservationsDB(DateTime dateRange)
        {

            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT R.RESERVATION_NUMBER, P.OWN_OWNER_NUMBER, PR.PET_PET_NUMBER,  P.PET_NAME, R.RESERVATION_START_DATE, R.RESERVATION_END_DATE
FROM HVK_PET_RESERVATION PR
INNER JOIN HVK_PET P
ON P.PET_NUMBER = PR.PET_PET_NUMBER
INNER JOIN HVK_RESERVATION R
ON R.RESERVATION_NUMBER = PR.RES_RESERVATION_NUMBER
where R.RESERVATION_START_DATE >= :dateRange AND R.RESERVATION_START_DATE < ADD_MONTHS (:dateRange, 3)
ORDER BY R.RESERVATION_NUMBER, P.PET_NUMBER";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;

            cmd.Parameters.Add("dateRange", dateRange);
            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet upcomingReservationsByOwnerDB(int ownerNum)
        {

            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT R.RESERVATION_NUMBER, P.OWN_OWNER_NUMBER, PR.PET_PET_NUMBER,  P.PET_NAME, R.RESERVATION_START_DATE, R.RESERVATION_END_DATE
FROM HVK_PET_RESERVATION PR
INNER JOIN HVK_PET P
ON P.PET_NUMBER = PR.PET_PET_NUMBER
INNER JOIN HVK_RESERVATION R
ON R.RESERVATION_NUMBER = PR.RES_RESERVATION_NUMBER
where R.RESERVATION_START_DATE >= SYSDATE AND R.RESERVATION_START_DATE < ADD_MONTHS (SYSDATE, 3) AND P.OWN_OWNER_NUMBER = :ownerNum
ORDER BY R.RESERVATION_NUMBER, P.PET_NUMBER";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;

            cmd.Parameters.Add("ownerNum", ownerNum);

            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }

        public DataSet getReservationDB(int resNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT R.RESERVATION_NUMBER,
  R.RESERVATION_START_DATE,
  R.RESERVATION_END_DATE,
  PR.PET_PET_NUMBER,
  P.OWN_OWNER_NUMBER
FROM HVK_RESERVATION R
INNER JOIN HVK_PET_RESERVATION PR
ON R.RESERVATION_NUMBER = PR.RES_RESERVATION_NUMBER
INNER JOIN HVK_PET P
ON PR.PET_PET_NUMBER       = P.PET_NUMBER
                    WHERE R.RESERVATION_NUMBER = :resNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("resNum", resNum);

            DataSet ds = new DataSet("resDataSet");
            da.Fill(ds, "hvk_reservation");
            return ds;
        }

        public DataSet getEmptyReservationDB(int resNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT R.RESERVATION_NUMBER,
  R.RESERVATION_START_DATE,
  R.RESERVATION_END_DATE
FROM HVK_RESERVATION R
                    WHERE R.RESERVATION_NUMBER = :resNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("resNum", resNum);

            DataSet ds = new DataSet("resDataSet");
            da.Fill(ds, "hvk_reservation");
            return ds;
        }

        public void addReservationDB(DateTime start, DateTime end)
        {
            String startDate = start.ToString("dd-MMM-yyyy");
            String endDate = end.ToString("dd-MMM-yyyy");
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @" INSERT
INTO HVK_RESERVATION
  (
    RESERVATION_NUMBER,
    RESERVATION_START_DATE,
    reservation_end_date
  )
  VALUES
  (
    hvk_reservation_seq.nextval,
    to_date(:RESERVATION_START_DATE,'dd-MON-YYYY'),
    to_date(:RESERVATION_END_DATE,'dd-MON-YYYY')
  )";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            cmd.Parameters.Add("RESERVATION_START_DATE", startDate);
            cmd.Parameters.Add("RESERVATION_END_DATE", endDate);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.InsertCommand = cmd;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            finally
            {
                con.Close();
            }
        }


        public void deleteDogFromReservation(int resNum, int petNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            try
            {

                con.Open();

                string cmdStr = "";

                cmdStr = @"DELETE
FROM HVK_PET_RESERVATION_SERVICE
WHERE PR_PET_RES_NUMBER IN
  (SELECT PR.PET_RES_NUMBER
  FROM HVK_PET_RESERVATION PR
  WHERE RES_RESERVATION_NUMBER = :resNum
  AND PR.PET_PET_NUMBER = :petNum
 )";
                OracleCommand cmd = new OracleCommand(cmdStr, con);
                cmd.Parameters.Add("resNum", resNum);
                cmd.Parameters.Add("petNum", petNum);
                cmd.ExecuteNonQuery();

                cmd.CommandText = @"DELETE FROM HVK_PET_RESERVATION PR WHERE PR.RES_RESERVATION_NUMBER = :resNum AND PR.PET_PET_NUMBER = :petNum";
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

        public void changeReservationDB(int resNum, DateTime start, DateTime end)
        {

            String startDate = start.ToString("dd-MMM-yy");
            String endDate = end.ToString("dd-MMM-yy");
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @" update hvk_reservation
set RESERVATION_START_DATE = to_date(:RESERVATION_START_DATE, 'DD-Mon-YY'), 
RESERVATION_END_DATE = to_date(:RESERVATION_END_DATE, 'DD-Mon-YY') where RESERVATION_NUMBER = :resNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            cmd.Parameters.Add("RESERVATION_START_DATE", startDate);
            cmd.Parameters.Add("RESERVATION_END_DATE", endDate);
            cmd.Parameters.Add("resNum", resNum);

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


        public void cancelReservationDB(int resNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            try
            {

                con.Open();

                string cmdStr = "";

                cmdStr = @"delete from HVK_PET_RESERVATION_SERVICE where
                               PR_PET_RES_NUMBER in (select pet_res_number from hvk_pet_reservation where RES_RESERVATION_NUMBER = :resNum)";
                OracleCommand cmd = new OracleCommand(cmdStr, con);
                cmd.Parameters.Add("resNum", resNum);
                cmd.ExecuteNonQuery();

                cmd.CommandText = @"delete from HVK_PET_RESERVATION where
                                RES_RESERVATION_NUMBER = :resNum";
                cmd.ExecuteNonQuery();

                cmd.CommandText = @"delete from hvk_reservation where
                                RESERVATION_NUMBER = :resNum";
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

        [DataObjectMethod(DataObjectMethodType.Select, true)]

        public DataSet getReservationStartingTodayDB()
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT O.OWNER_LAST_NAME, O.OWNER_FIRST_NAME, R.RESERVATION_START_DATE, R.RESERVATION_END_DATE
FROM HVK_RESERVATION R
INNER JOIN HVK_PET_RESERVATION PR
ON PR.RES_RESERVATION_NUMBER = R.RESERVATION_NUMBER
INNER JOIN HVK_PET P 
ON P.PET_NUMBER = PR.PET_PET_NUMBER
INNER JOIN HVK_OWNER O
ON O.OWNER_NUMBER = P.OWN_OWNER_NUMBER
WHERE R.RESERVATION_START_DATE = SYSDATE";
            OracleCommand cmd = new OracleCommand(cmdStr, con);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            DataSet ds = new DataSet("Pet");
            da.Fill(ds, "HVKPET");

            return ds;
        }

        public DataSet getReservationEndingTodayDB()
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT O.OWNER_LAST_NAME, O.OWNER_FIRST_NAME, R.RESERVATION_START_DATE, R.RESERVATION_END_DATE
FROM HVK_RESERVATION R
INNER JOIN HVK_PET_RESERVATION PR
ON PR.RES_RESERVATION_NUMBER = R.RESERVATION_NUMBER
INNER JOIN HVK_PET P 
ON P.PET_NUMBER = PR.PET_PET_NUMBER
INNER JOIN HVK_OWNER O
ON O.OWNER_NUMBER = P.OWN_OWNER_NUMBER
WHERE R.RESERVATION_END_DATE = SYSDATE";
            OracleCommand cmd = new OracleCommand(cmdStr, con);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            DataSet ds = new DataSet("Pet");
            da.Fill(ds, "HVKPET");

            return ds;
        }
    }
}
