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
    public class PetRunDB
    {
        public int countLargeRunsDB()
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT COUNT(*) from HVK_RUN WHERE RUN_SIZE = 'L'";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            DataSet ds = new DataSet("countDataSet");
            da.Fill(ds, "HVK_RUN");
            return Convert.ToInt32(ds.Tables[0].Rows[0]["Count(*)"].ToString());
        }//counts the database's total number of large runs, available or not

        public int countAllRunsDB()
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT COUNT(*) from HVK_RUN";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            DataSet ds = new DataSet("countDataSet");
            da.Fill(ds, "HVK_RUN");
            return Convert.ToInt32(ds.Tables[0].Rows[0]["Count(*)"].ToString());
        }//counts the database's total number of runs, available or not

        public int allRunAvailableDB(DateTime d)
        {
            int runs = countAllRunsDB();
            String date = d.ToString("dd-MMM-yyyy");

            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT r.RESERVATION_NUMBER
FROM  HVK_RESERVATION r

WHERE TO_DATE('" + date + "','dd-mon-yyyy') BETWEEN r.RESERVATION_START_DATE AND r.RESERVATION_END_DATE";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            DataSet ds = new DataSet("countDataSet");
            da.Fill(ds, "HVK_RUN");
            DataTable t = ds.Tables[0];

            return runs - t.Rows.Count;
        }//counts the number of available runs for a given date

        public int largeRunAvailableDB(DateTime d)
        {
            int runs = countLargeRunsDB();
            String date = d.ToString("dd-MMM-yyyy");

            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            String cmdStr = @"SELECT r.RESERVATION_NUMBER, pr.RES_RESERVATION_NUMBER, pr.PET_PET_NUMBER, pr.PET_RES_NUMBER, p.PET_NUMBER, p.DOG_SIZE
FROM HVK_PET_RESERVATION pr
JOIN HVK_RESERVATION r
ON r.RESERVATION_NUMBER = pr.RES_RESERVATION_NUMBER
JOIN HVK_PET p ON p.PET_NUMBER = pr.PET_PET_NUMBER
WHERE (TO_DATE('" + date + "','dd-mon-yyyy') BETWEEN r.RESERVATION_START_DATE AND r.RESERVATION_END_DATE) AND (p.DOG_SIZE = 'L')";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            DataSet ds = new DataSet("countDataSet");
            da.Fill(ds, "HVK_RUN");
            DataTable t = ds.Tables[0];

            return runs - t.Rows.Count;
        }//counts the number of large available runs for a given date
    }
}
