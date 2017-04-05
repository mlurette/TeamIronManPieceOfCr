using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IronManhvkDB;
using System.Data;
using System.ComponentModel;

namespace IronManhvkBLL
{
    public enum Codes
    {
          success,
          petAlreadyInReservation,
          invalidReservationNumber,
          dogHasDifferentOwner,
          reservationInPast,
          petHasConflictingReservation,
          startDateAfterEndDate,
          startDateInPast,
          noRunAvailable,
          insertFailed,
          deleteFailed,
          changeFailed,
          dogNotInReservation,
          InvalidPetNumber
    }

    public class Reservation
    {
        public int reservationNumber { get; set; }
        public DateTime reservationStartDate { get; set; }
        public DateTime reservationEndDate { get; set; }
        public List<Discount> reservationDiscount { get; set; }
        public List<PetReservation> petReservation { get; set; }
        public Owner owner { get; set; }

        public Reservation()
        {
            petReservation = new List<PetReservation>();
            reservationDiscount = new List<Discount>();
            reservationNumber = 0;
            reservationStartDate = DateTime.Now;
            reservationEndDate = DateTime.Now;
        }

        public Reservation(int number, DateTime start, DateTime end)
        {

            petReservation = new List<PetReservation>();
            reservationDiscount = new List<Discount>();
            reservationNumber = number;
            reservationStartDate = start;
            reservationEndDate = end;
        }

        public void addReservationDiscount(Discount newDiscount)
        {
            reservationDiscount.Add(newDiscount);
        }

        public void addPetReservation(PetReservation newPetReservation)
        {
            petReservation.Add(newPetReservation);
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]

        public List<Reservation> listReservations(int ownerNumber)
        {
            ReservationDB resDB = new ReservationDB();
            DataSet reservations = resDB.listReservationsDB(ownerNumber);
            return getReservationList(reservations.Tables[0], "ListReservations");
        }

        public List<Reservation> listActiveReservations(int ownerNumber, DateTime start, DateTime end)
        {
            ReservationDB resDB = new ReservationDB();
            DataSet reservations = null;
            if (ownerNumber == -1)
            {
                reservations = resDB.listActiveReservationsDB(start, end);
            }
            else
            {
                reservations = resDB.listActiveReservationsDB(ownerNumber, start, end);

            }
            return getReservationList(reservations.Tables[0], "ActiveReservations");
        }

        public List<Reservation> upcomingReservations(DateTime date)
        {
            ReservationDB resDB = new ReservationDB();
            DataSet reservations = resDB.upcomingReservationsDB(date);
            if (date < DateTime.Now)
            {
                return null;
            }
            else
            {
                return getReservationList(reservations.Tables[0], "UpcomingReservations");
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<Reservation> upcomingReservationsByOwner(int ownerNum)
        {
            ReservationDB resDB = new ReservationDB();
            DataSet reservations = resDB.upcomingReservationsByOwnerDB(ownerNum);

                return getReservationList(reservations.Tables[0], "UpcomingReservations");
        }

        public Codes checkConflictingReservation(int petNum, DateTime start, DateTime end)
        {
            Codes code = Codes.success;

            PetReservationDB petRes = new PetReservationDB();
            DataSet conflicting = petRes.checkConflictingReservationDB(petNum, start, end);
            if (conflicting.Tables[0].Rows.Count != 0)
            {
                code = Codes.petHasConflictingReservation;
            }
            return code;
        }

        public Codes checkPetInReservation(int petNum, Reservation res)
        {
            Codes code = Codes.success;
            List<PetReservation> petReservation = res.petReservation;
            for (int i = 0; i < petReservation.Count; i++)
            {
                Pet currentPet = petReservation.ElementAt(i).pet;
                if (petNum == currentPet.petNumber)
                {
                    code = Codes.petAlreadyInReservation;
                }
            }

            return code;
        }

        public Codes addToReservation(int reservationNum, int petNum)
        {
            Codes code = Codes.success;
            ReservationDB reservationDB = new ReservationDB();

            DataSet resDS = reservationDB.getReservationDB(reservationNum);

            if (resDS.Tables[0].Rows.Count == 0)
            {
                code = Codes.invalidReservationNumber;
            }
            else
            {
                Pet pet = new Pet();
                int ownerNum = pet.getPetOwner(petNum);
                char dogSize = pet.getPetSize(petNum);

                Reservation reservation = getReservation(reservationNum);

                if (reservation.owner.ownerNumber != ownerNum)
                {
                    code = Codes.dogHasDifferentOwner;
                }
                else if (reservation.reservationStartDate < DateTime.Now)
                {
                    code = Codes.reservationInPast;
                }
                else
                {
                    code = checkPetInReservation(petNum, reservation);
                    if (code == Codes.success)
                    {
                        PetReservationDB petRes = new PetReservationDB();
                        code = checkConflictingReservation(petNum, reservation.reservationStartDate, reservation.reservationEndDate);

                        if (code == Codes.success)
                        {
                            PetRun petRun = new PetRun();
                            code = petRun.checkRunAvailability(reservation.reservationStartDate, reservation.reservationEndDate, dogSize);
                            if (code == Codes.success)
                            {
                                petRes.addToReservationDB(petNum, reservationNum);
                            }
                        }
                    }
                }
            }
            return code;
        }

        private List<Reservation> getReservationList(DataTable reservationTable, String fetchType)
        {
            List<Reservation> reservations = new List<Reservation>();
            int lastResNum = 0;
            int index = 0;

            foreach (DataRow row in reservationTable.Rows)
            {
                int petNumber = Convert.ToInt32(row["PET_PET_NUMBER"].ToString());
                int resNumber = Convert.ToInt32(row["RESERVATION_NUMBER"].ToString());
                String petName = row["PET_NAME"].ToString();
                DateTime resStartDate = Convert.ToDateTime(row["RESERVATION_START_DATE"]);
                DateTime resEndDate = Convert.ToDateTime(row["RESERVATION_END_DATE"]);

                Pet pet = new Pet();
                pet.petNumber = petNumber;
                pet.petName = petName;

                PetReservation petRes = new PetReservation();
                petRes.pet = pet;

                if (resNumber == lastResNum)
                {
                    reservations.ElementAt(index - 1).petReservation.Add(petRes);
                }
                else
                {
                    Reservation res = new Reservation(resNumber, resStartDate, resEndDate);
                    res.petReservation.Add(petRes);

                    if (fetchType == "UpcomingReservations")
                    {
                        Owner resOwner = new Owner();
                        resOwner.ownerNumber = Convert.ToInt32(row["OWN_OWNER_NUMBER"].ToString());
                        res.owner = resOwner;
                    }
                    else if (fetchType == "ActiveReservations")
                    {
                        if (row["RUN_RUN_NUMBER"].ToString() != "")
                        {
                            petRes.runNumber = Convert.ToInt16(row["RUN_RUN_NUMBER"].ToString());
                        }
                        else
                        {
                            petRes.runNumber = 0;
                        }
                        Owner resOwner = new Owner();
                        resOwner.ownerLastName = row["OWNER_LAST_NAME"].ToString();
                        resOwner.ownerFirstName = row["OWNER_FIRST_NAME"].ToString();

                        res.owner = resOwner;
                    }
                    reservations.Add(res);
                    index++;
                }
                lastResNum = resNumber;

            }

            if (reservations.Count == 0)
            {
                reservations = null;
            }

            return reservations;
        }

        private Reservation getReservation(int resNum)
        {
            ReservationDB resDB = new ReservationDB();
            Reservation reservation = new Reservation();
            DataSet dsRes = resDB.getReservationDB(resNum);
            DataTable dtRes = dsRes.Tables[0];

            if (dtRes.Rows.Count != 0)
            {
                reservation.reservationNumber = Convert.ToInt32(dtRes.Rows[0]["RESERVATION_NUMBER"].ToString());
                reservation.reservationStartDate = Convert.ToDateTime(dtRes.Rows[0]["RESERVATION_START_DATE"]);
                reservation.reservationEndDate = Convert.ToDateTime(dtRes.Rows[0]["RESERVATION_END_DATE"]);

                if (dtRes.Rows[0]["OWN_OWNER_NUMBER"].ToString() != "")
                {
                    int ownerNumber = Convert.ToInt16(dtRes.Rows[0]["OWN_OWNER_NUMBER"].ToString());
                    Owner owner = new Owner();
                    owner.ownerNumber = ownerNumber;

                    reservation.owner = owner;
                }

                foreach (DataRow row in dtRes.Rows)
                {
                    if (row["PET_PET_NUMBER"].ToString() != "")
                    {
                        int petNumber = Convert.ToInt32(row["PET_PET_NUMBER"].ToString());
                        Pet pet = new Pet();
                        pet.petNumber = petNumber;

                        PetReservation petRes = new PetReservation();
                        petRes.pet = pet;

                        reservation.addPetReservation(petRes);
                    }
                }
            }
            else
            {
                reservation = null;
            }
            return reservation;
        }

        private Reservation getEmptyReservation(int resNum)
        {
            ReservationDB resDB = new ReservationDB();
            Reservation reservation = new Reservation();
            DataSet dsRes = resDB.getEmptyReservationDB(resNum);
            DataTable dtRes = dsRes.Tables[0];

            if (dtRes.Rows.Count != 0)
            {
                reservation.reservationNumber = Convert.ToInt32(dtRes.Rows[0]["RESERVATION_NUMBER"].ToString());
                reservation.reservationStartDate = Convert.ToDateTime(dtRes.Rows[0]["RESERVATION_START_DATE"]);
                reservation.reservationEndDate = Convert.ToDateTime(dtRes.Rows[0]["RESERVATION_END_DATE"]);
            }
            else
            {
                reservation = null;
            }
            return reservation;
        }

        public Codes checkDatesValid(DateTime start, DateTime end)
        {
            Codes code = Codes.success;

            if (start > end)
            {
                code = Codes.startDateAfterEndDate;
            }
            else if (start < DateTime.Now)
            {
                code = Codes.startDateInPast;
            }
            return code;
        }

        public Codes addReservation(int petNum, DateTime start, DateTime end)
        {
            Codes code = 0;

            Pet pet = new Pet();
            char size = pet.getPetSize(petNum);

            code = checkDatesValid(start, end);

            if (code == Codes.success)
            {
                PetRun petRun = new PetRun();
                code = petRun.checkRunAvailability(start, end, size);
                if (code == Codes.success)
                {
                    try
                    {
                        ReservationDB reservation = new ReservationDB();
                        reservation.addReservationDB(start, end);
                        PetReservationDB petReservation = new PetReservationDB();
                        petReservation.addToReservationDB(petNum);
                        petReservation.insertPetReservationServiceDB(1);
                        code = Codes.success;
                    }
                    catch (Exception e)
                    {
                        code = Codes.insertFailed;
                    }
                }
            }

            return code;
        }

        public Codes cancelReservation(int resNum)
        {
            Codes code = Codes.success;
            Reservation reservation = new Reservation();
            reservation = reservation.getReservation(resNum);

            if (reservation == null)
            {
                reservation = getEmptyReservation(resNum);
                if (reservation == null)
                {
                    code = Codes.invalidReservationNumber;
                }
            }

            if (reservation != null)
            {
                if (reservation.reservationEndDate < DateTime.Now)
                {
                    code = Codes.reservationInPast;
                }
                else
                {
                    try
                    {
                        ReservationDB resDB = new ReservationDB();
                        resDB.cancelReservationDB(resNum);
                        code = Codes.success;
                    }
                    catch (Exception e)
                    {
                        code = Codes.deleteFailed;
                    }
                }
            }
            return code;
        }

        public Codes checkPetResInformation(List<PetReservation> petRes, DateTime start, DateTime end)
        {
            PetRun runs = new PetRun();
            Codes code = Codes.success;

            for (int i = 0; i < petRes.Count; i++)
            {
                Pet currentPet = petRes.ElementAt(i).pet;
                code = runs.checkRunAvailability(start, end, currentPet.getPetSize(currentPet.petNumber));
                if (code != Codes.noRunAvailable)
                {
                    code = checkConflictingReservation(currentPet.petNumber, start, end);
                }
            }

            return code;
        }

        public Codes changeReservation(int resNum, DateTime start, DateTime end)
        {
            Codes code = Codes.success;
            ReservationDB reservationDB = new ReservationDB();

            Reservation reservation = new Reservation();
            reservation = getReservation(resNum);

            if (reservation == null)
            {
                code = Codes.invalidReservationNumber;
            }
            else
            {
                code = checkDatesValid(start, end);

                if (code == Codes.success)
                {


                    if (code == Codes.success)
                    {
                        code = checkPetResInformation(reservation.petReservation, start, end);
                        if (code == Codes.success)
                        {
                            try
                            {

                                reservationDB.changeReservationDB(resNum, start, end);
                                return Codes.success;
                            }
                            catch (Exception e)
                            {
                                return Codes.changeFailed;
                            }

                        }
                    }
                }
            }
            return code;
        }

        public Codes comparePetPassedIn(int petNum, List<PetReservation> actualPets)
        {
            Codes code = Codes.dogNotInReservation;
            for (int i = 0; i < actualPets.Count; i++)
            {
                Pet currentPet = actualPets.ElementAt(i).pet;
                if (currentPet.petNumber == petNum)
                {
                    code = Codes.success;
                }
            }


            return code;
        }

        public Codes deleteDogFromReservation(int resNum, int petNum)
        {
            Codes code = Codes.success;

            ReservationDB reservationDB = new ReservationDB();

            Reservation reservation = new Reservation();
            reservation = getReservation(resNum);

            //if removing last pet then delete reservation
            if (reservation == null)
            {
                code = Codes.invalidReservationNumber;
            }
            else
            {
                DateTime start = reservation.reservationStartDate;
                DateTime end = reservation.reservationEndDate;

                if (end < DateTime.Now)
                {
                    code = Codes.reservationInPast;
                }
                else
                {
                    code = comparePetPassedIn(petNum, reservation.petReservation);
                    if (code == Codes.success)
                    {
                        int previousCount = reservation.petReservation.Count;

                        reservationDB.deleteDogFromReservation(resNum, petNum);
                        reservation = getReservation(resNum);
                        try
                        {
                            if (reservation.petReservation.Count == previousCount)
                            {
                                code = Codes.deleteFailed;
                            }
                        }
                        catch
                        {
                            Reservation res = new Reservation();
                            code = res.cancelReservation(resNum);
                        }
                    }
                }
            }
            return code;
        }


        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<Reservation> getReservationStartingToday()
        {
            ReservationDB resDB = new ReservationDB();

            DataSet dsRes = resDB.getReservationStartingTodayDB();

            return getResToday(dsRes.Tables[0]);
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<Reservation> getReservationEndingToday()
        {
            ReservationDB resDB = new ReservationDB();

            DataSet dsRes = resDB.getReservationEndingTodayDB();

            return getResToday(dsRes.Tables[0]);
        }

        private List<Reservation> getResToday(DataTable dtRes)
        {
            List<Reservation> reservations = new List<Reservation>();
            Reservation reservation = new Reservation();

            foreach(DataRow row in dtRes.Rows)
            {
                reservation.reservationStartDate = Convert.ToDateTime(dtRes.Rows[0]["RESERVATION_START_DATE"]);
                reservation.reservationEndDate = Convert.ToDateTime(dtRes.Rows[0]["RESERVATION_END_DATE"]);
                String ownerFirstName = dtRes.Rows[0]["OWNER_FIRST_NAME"].ToString();
                String ownerLastName = dtRes.Rows[0]["OWNER_LAST_NAME"].ToString();

                Owner owner = new Owner();
                owner.ownerFirstName = ownerFirstName;
                owner.ownerLastName = ownerLastName;

                reservation.owner = owner;

                reservations.Add(reservation);
            }
            return reservations;
        }
    }
}
