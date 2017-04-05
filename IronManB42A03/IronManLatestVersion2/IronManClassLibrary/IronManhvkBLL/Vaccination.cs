using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IronManhvkDB;
using System.Data;

namespace IronManhvkBLL
{
    public class Vaccination
    {
        public int vaccinationNumber { get; set; }
        public String vaccinationName { get; set; }
        public DateTime vaccinationExpiryDate { get; set; }
        public char vaccinationFlag { get; set; }

        public Vaccination()
        {
            vaccinationNumber = 0;
            vaccinationName = "";
            vaccinationExpiryDate = DateTime.Now;
            vaccinationFlag = ' ';
        }

        public Vaccination(int num, String name, DateTime expiry)
        {
            vaccinationNumber = num;
            vaccinationName = name;
            vaccinationExpiryDate = expiry;
            vaccinationFlag = ' ';
        }

        public Vaccination(int num, String name, DateTime expiry, char flag)
        {
            vaccinationNumber = num;
            vaccinationName = name;
            vaccinationExpiryDate = expiry;
            vaccinationFlag = flag;
        }

        public List<Vaccination> listVaccinations(int petNumber)
        {
            VaccinationDB vacc = new VaccinationDB();
            DataSet vaccinations = vacc.listVaccinationsDB(petNumber);
            
            return getVaccinations(vaccinations.Tables[0], "ListVaccinations");
        }


        public List<Vaccination> checkVaccinations(int reservationNumber, int petNumber)
        {
            VaccinationDB vacc = new VaccinationDB();
            DataSet vaccinations = vacc.checkVaccinationsDB(reservationNumber, petNumber);

            return getVaccinations(vaccinations.Tables[0], "CheckVaccinations");
        }

        public List<Vaccination> getVaccinations(DataTable vaccTable, String fetchType)
        {
            List<Vaccination> vaccinations = new List<Vaccination>();

            foreach (DataRow row in vaccTable.Rows)
            {
                String vaccName = row["VACCINATION_NAME"].ToString();
                Vaccination petVacc = new Vaccination();
                petVacc.vaccinationName = vaccName;

                if (fetchType == "ListVaccinations")
                {
                    DateTime vaccExpiry = Convert.ToDateTime(row["VACCINATION_EXPIRY_DATE"].ToString());
                    char vaccStatus = Convert.ToChar(row["VACCINATION_CHECKED_STATUS"].ToString());
                    petVacc.vaccinationExpiryDate = vaccExpiry;
                    petVacc.vaccinationFlag = vaccStatus;

                }

                vaccinations.Add(petVacc);
            }

            if(vaccinations.Count == 0)
            {
                return null;
            }

            return vaccinations;
        }
    }
}
