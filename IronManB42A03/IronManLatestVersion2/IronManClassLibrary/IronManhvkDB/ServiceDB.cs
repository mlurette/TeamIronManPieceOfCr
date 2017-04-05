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
    public class ServiceDB
    {
        public DataSet getPetResServiceDB(int petResNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT PRS.SERV_SERVICE_NUMBER, S.SERVICE_DESCRIPTION
FROM HVK_PET_RESERVATION_SERVICE PRS
INNER JOIN HVK_SERVICE S
ON S.SERVICE_NUMBER = PRS.SERV_SERVICE_NUMBER
WHERE PRS.PR_PET_RES_NUMBER = :petResNum";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petResNum", petResNum);
            DataSet ds = new DataSet("resDataSet");
            da.Fill(ds, "hvk_petreservation");

            return ds;
        }
    }
}
