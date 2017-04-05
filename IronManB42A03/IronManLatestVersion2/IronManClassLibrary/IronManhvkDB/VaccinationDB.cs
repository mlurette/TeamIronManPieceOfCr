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
    public class VaccinationDB
    {
        public DataSet listVaccinationsDB(int petNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT vac.VACCINATION_NAME,
  pvac.VACCINATION_EXPIRY_DATE,
  pvac.VACCINATION_CHECKED_STATUS
FROM HVK_VACCINATION vac,
  HVK_PET_VACCINATION pvac
  where pvac.PET_PET_NUMBER = :petNum
  and pvac.VACC_VACCINATION_NUMBER = vac.VACCINATION_NUMBER";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petNum", petNum);

            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }

        public DataSet checkVaccinationsDB(int resNum, int petNum)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleConnection con = new OracleConnection(conString);
            string cmdStr = @"SELECT V.VACCINATION_NAME
FROM HVK_VACCINATION V
LEFT JOIN HVK_PET_VACCINATION PV
ON V.VACCINATION_NUMBER = PV.VACC_VACCINATION_NUMBER
AND PV.PET_PET_NUMBER   = :petNum
LEFT JOIN HVK_PET_RESERVATION PR
ON PR.PET_PET_NUMBER                 = PV.PET_PET_NUMBER
AND PR.RES_RESERVATION_NUMBER        = :resNum
WHERE (PV.VACCINATION_CHECKED_STATUS = 'N'
OR PV.VACCINATION_CHECKED_STATUS    IS NULL)
AND :petNum                IN
  (SELECT P.PET_NUMBER FROM HVK_PET P
  )
AND :resNum IN
  (SELECT R.RESERVATION_NUMBER FROM HVK_RESERVATION R
  )
AND :petNum IN (SELECT PR.PET_PET_NUMBER
FROM HVK_PET_RESERVATION PR
WHERE PR.RES_RESERVATION_NUMBER = :resNum)
ORDER BY V.VACCINATION_NAME";
            OracleCommand cmd = new OracleCommand(cmdStr, con);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            da.SelectCommand = cmd;
            cmd.Parameters.Add("petNum", petNum);
            cmd.Parameters.Add("resNum", resNum);
            DataSet ds = new DataSet("deptDataSet");
            da.Fill(ds, "hvk_owner");
            return ds;
        }

    }
}
