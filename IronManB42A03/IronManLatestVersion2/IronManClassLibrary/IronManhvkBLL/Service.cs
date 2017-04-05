using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IronManhvkDB;
using System.Data;

namespace IronManhvkBLL
{
    public class Service
    {
        public int serviceNumber { get; set; }
        public String serviceDescription { get; set; }
        public int dailyRateNumber { get; set; }
        public double dailyRate { get; set; }
        public char dailyRateDogSize { get; set; }
        public int serviceFrequency { get; set; }

        public Service()
        {
            serviceNumber = 0;
            dailyRateNumber = 0;
            serviceDescription = "";
            dailyRate = 0;
            dailyRateDogSize = ' ';
            serviceFrequency = 0;
        }

        public Service(int serviceNum, String desc, int dailRateNum, int rate, char dogSize, int frq)
        {
            serviceNumber = serviceNum;
            dailyRateNumber = dailRateNum;
            serviceDescription = desc;
            dailyRate = rate;
            dailyRateDogSize = dogSize;
            serviceFrequency = frq;
        }

        public List<Service> getPetResService(int petResNum)
        {
            List<Service> services = new List<Service>();
            ServiceDB servDB = new ServiceDB();
            DataSet dsService = servDB.getPetResServiceDB(petResNum);

            foreach (DataRow drPetRes in dsService.Tables[0].Rows)
            {
                Service currentService = new Service();

                int serviceNumber = Convert.ToInt16(drPetRes["SERV_SERVICE_NUMBER"].ToString());

                if(serviceNumber == 1 || serviceNumber == 2 || serviceNumber == 5)
                {
                    String serviceName = drPetRes["SERVICE_DESCRIPTION"].ToString();

                    currentService.serviceDescription = serviceName;
                    currentService.serviceNumber = serviceNumber;

                    services.Add(currentService);

                }
            }

            return services;
        }
    }
}
