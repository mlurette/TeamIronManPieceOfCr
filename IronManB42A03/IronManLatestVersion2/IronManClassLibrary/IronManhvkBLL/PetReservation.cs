using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IronManhvkDB;
using System.Data;

namespace IronManhvkBLL
{
    public class PetReservation
    {
        public int petReservationNumber { get; set; }
        public Pet pet { get; set; }
        public int reservationNumber { get; set; }
        public int runNumber { get; set; }
        public List<Medication> petMedication { get; set; }
        public List<KennelLog> kennelLog { get; set; }
        public List<Service> petReservationService { get; set; }
        public List<Discount> petReservationDiscount { get; set; }

        public PetReservation()
        {
            petMedication = new List<Medication>();
            kennelLog = new List<KennelLog>();
            petReservationService = new List<Service>();
            petReservationDiscount = new List<Discount>();
            petReservationNumber = 0;
            pet = new Pet();
            reservationNumber = 0;
            runNumber = 0;
        }

        public PetReservation(int petResNum, Pet resPet, int resNum)
        {
            petMedication = new List<Medication>();
            kennelLog = new List<KennelLog>();
            petReservationService = new List<Service>();
            petReservationDiscount = new List<Discount>();
            petReservationNumber = petResNum;
            pet = resPet;
            reservationNumber = resNum;
            runNumber = 0;
        }

        public PetReservation(int petResNum, Pet resPet, int resNum, int runNum)
        {
            petMedication = new List<Medication>();
            kennelLog = new List<KennelLog>();
            petReservationService = new List<Service>();
            petReservationDiscount = new List<Discount>();
            petReservationNumber = petResNum;
            pet = resPet;
            reservationNumber = resNum;
            runNumber = runNum;
        }

        public List<PetReservation> getPetReservations(int resNum)
        {
            List<PetReservation> petReservations = new List<PetReservation>();
            PetReservationDB petResDB = new PetReservationDB();
            DataSet dsPet = petResDB.getAllPetReservationsDB(resNum);

            foreach (DataRow drPetRes in dsPet.Tables[0].Rows)
            {
                PetReservation currentPetRes = new PetReservation();
                Pet pet = new Pet();
                Service serv = new Service();

                int petResNum = Convert.ToInt16(drPetRes["PET_RES_NUMBER"].ToString());
                int petNum = Convert.ToInt16(drPetRes["PET_PET_NUMBER"].ToString());
                int resNumber = Convert.ToInt16(drPetRes["RES_RESERVATION_NUMBER"].ToString());

                pet.petNumber = petNum;
                List<Service> services = serv.getPetResService(petResNum);

                currentPetRes.petReservationService = services;
                currentPetRes.petReservationNumber = petResNum;
                currentPetRes.pet = pet;

                petReservations.Add(currentPetRes);
            }
                

            return petReservations;
        } 

        
        public void addMedication(Medication newMedication)
        {
            petMedication.Add(newMedication);
        }

        public void addLogEntry(KennelLog newEntry)
        {
            kennelLog.Add(newEntry);
        }

        public void addService(Service newService)
        {
            petReservationService.Add(newService);
        }

        public void addPetReservationDiscount(Discount newDiscount)
        {
            petReservationDiscount.Add(newDiscount);
        }
    }
}
