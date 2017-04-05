using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
using System.Collections.Generic;
using System.Linq;

namespace IronManUnitTests
{
    [TestClass]
    public class UpcomingReservationsTest
    {
        [TestMethod]
        public void TestReservationsOnJune20AndAfter()
        {
            //setup
            Reservation newRes = new Reservation();
            DateTime resDate = Convert.ToDateTime("06/20/2017");
            List<Reservation> upcomingReservation = newRes.upcomingReservations(resDate);

            int expectedListSize = 6;
            Reservation res1 = upcomingReservation.ElementAt(0);
            Reservation res2 = upcomingReservation.ElementAt(1);
            Reservation res3 = upcomingReservation.ElementAt(2);
            Reservation res4 = upcomingReservation.ElementAt(3);
            Reservation res5 = upcomingReservation.ElementAt(4);
            Reservation res6 = upcomingReservation.ElementAt(5);

            //expected results 

            Assert.AreEqual(expectedListSize, upcomingReservation.Count);
            //first reservation
            int expectedRes1Number = 800;
            int expectedRes1PetNumber1 = 31;
            int expectedRes1PetNumber2 = 32;
            int expectedRes1OwnerNumber = 17;
            DateTime expectedRes1StartDate = DateTime.Parse("06/20/2017");
            DateTime expectedRes1EndDate = DateTime.Parse("06/26/2017");

            //second reservation
            int expectedRes2Number = 801;
            int expectedRes2PetNumber1 = 26;
            int expectedRes2PetNumber2 = 27;
            int expectedRes2OwnerNumber = 15;
            DateTime expectedRes2StartDate = DateTime.Parse("06/20/2017");
            DateTime expectedRes2EndDate = DateTime.Parse("06/26/2017");

            //Third reservation
            int expectedRes3Number = 802;
            int expectedRes3PetNumber1 = 10;
            int expectedRes3PetNumber2 = 11;
            int expectedRes3OwnerNumber = 7;
            DateTime expectedRes3StartDate = DateTime.Parse("06/20/2017");
            DateTime expectedRes3EndDate = DateTime.Parse("06/26/2017");

            //Fourth reservation
            int expectedRes4Number = 804;
            int expectedRes4PetNumber1 = 10;
            int expectedRes4PetNumber2 = 11;
            int expectedRes4PetNumber3 = 12;
            int expectedRes4OwnerNumber = 7;
            DateTime expectedRes4StartDate = DateTime.Parse("08/20/2017");
            DateTime expectedRes4EndDate = DateTime.Parse("08/26/2017");

            //Fifth reservation
            int expectedRes5Number = 809;
            int expectedRes5PetNumber1 = 10;
            int expectedRes5PetNumber2 = 11;
            int expectedRes5PetNumber3 = 12;
            int expectedRes5OwnerNumber = 7;
            DateTime expectedRes5StartDate = DateTime.Parse("07/02/2017");
            DateTime expectedRes5EndDate = DateTime.Parse("07/09/2017");

            //Fourth reservation
            int expectedRes6Number = 811;
            int expectedRes6PetNumber1 = 13;
            int expectedRes6OwnerNumber = 3;
            DateTime expectedRes6StartDate = DateTime.Parse("06/26/2017");
            DateTime expectedRes6EndDate = DateTime.Parse("07/05/2017");



            //actions
            //first reservation
            Assert.AreEqual(expectedRes1Number, res1.reservationNumber, "Reservation Number 1");
            Assert.AreEqual(expectedRes1PetNumber1, res1.petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation 1");
            Assert.AreEqual(expectedRes1PetNumber2, res1.petReservation.ElementAt(1).pet.petNumber, "Pet Number 2 Reservation 1");
            Assert.AreEqual(expectedRes1OwnerNumber, res1.owner.ownerNumber, "Customer Number 1 Reservation");
            Assert.AreEqual(expectedRes1StartDate, res1.reservationStartDate, "Start Date Reservation 1");
            Assert.AreEqual(expectedRes1EndDate, res1.reservationEndDate, "Start Date Reservation 1");

            //second reservation
            Assert.AreEqual(expectedRes2Number, res2.reservationNumber, "Reservation Number 2");
            Assert.AreEqual(expectedRes2PetNumber1, res2.petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation 2");
            Assert.AreEqual(expectedRes2PetNumber2, res2.petReservation.ElementAt(1).pet.petNumber, "Pet Number 2 Reservation 2");
            Assert.AreEqual(expectedRes2OwnerNumber, res2.owner.ownerNumber, "Customer Number 2 Reservation");
            Assert.AreEqual(expectedRes2StartDate, res2.reservationStartDate, "Start Date Reservation 2");
            Assert.AreEqual(expectedRes2EndDate, res2.reservationEndDate, "Start Date Reservation 2");

            //third reservation
            Assert.AreEqual(expectedRes3Number, res3.reservationNumber, "Reservation Number 3");
            Assert.AreEqual(expectedRes3PetNumber1, res3.petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation 3");
            Assert.AreEqual(expectedRes3PetNumber2, res3.petReservation.ElementAt(1).pet.petNumber, "Pet Number 2 Reservation 3");
            Assert.AreEqual(expectedRes3OwnerNumber, res3.owner.ownerNumber, "Customer Number 3 Reservation");
            Assert.AreEqual(expectedRes3StartDate, res3.reservationStartDate, "Start Date Reservation 3");
            Assert.AreEqual(expectedRes3EndDate, res3.reservationEndDate, "Start Date Reservation 3");

            //fourth reservation
            Assert.AreEqual(expectedRes4Number, res4.reservationNumber, "Reservation Number 4");
            Assert.AreEqual(expectedRes4PetNumber1, res4.petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation 6");
            Assert.AreEqual(expectedRes4PetNumber2, res4.petReservation.ElementAt(1).pet.petNumber, "Pet Number 2 Reservation 6");
            Assert.AreEqual(expectedRes4PetNumber3, res4.petReservation.ElementAt(2).pet.petNumber, "Pet Number 3 Reservation 6");
            Assert.AreEqual(expectedRes4OwnerNumber, res4.owner.ownerNumber, "Customer Number 6 Reservation");
            Assert.AreEqual(expectedRes4StartDate, res4.reservationStartDate, "Start Date Reservation 6");
            Assert.AreEqual(expectedRes4EndDate, res4.reservationEndDate, "Start Date Reservation 6");

            //fifth reservation
            Assert.AreEqual(expectedRes5Number, res5.reservationNumber, "Reservation Number 5");
            Assert.AreEqual(expectedRes5PetNumber1, res5.petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation 5");
            Assert.AreEqual(expectedRes5PetNumber2, res5.petReservation.ElementAt(1).pet.petNumber, "Pet Number 2 Reservation 5");
            Assert.AreEqual(expectedRes5PetNumber3, res5.petReservation.ElementAt(2).pet.petNumber, "Pet Number 3 Reservation 5");
            Assert.AreEqual(expectedRes5OwnerNumber, res5.owner.ownerNumber, "Customer Number 5 Reservation");
            Assert.AreEqual(expectedRes5StartDate, res5.reservationStartDate, "Start Date Reservation 5");
            Assert.AreEqual(expectedRes5EndDate, res5.reservationEndDate, "Start Date Reservation 5");

            //sixth reservation
            Assert.AreEqual(expectedRes6Number, res6.reservationNumber, "Reservation Number 6");
            Assert.AreEqual(expectedRes6PetNumber1, res6.petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation 6");
            Assert.AreEqual(expectedRes6OwnerNumber, res6.owner.ownerNumber, "Customer Number 6 Reservation");
            Assert.AreEqual(expectedRes6StartDate, res6.reservationStartDate, "Start Date Reservation 6");
            Assert.AreEqual(expectedRes6EndDate, res6.reservationEndDate, "Start Date Reservation 6");

        }

        [TestMethod]
        public void TestDateInPast()
        {
            //Setup
            Reservation newRes = new Reservation();
            List<Reservation> upcomingReservations = newRes.upcomingReservations(Convert.ToDateTime("01/01/2017"));

            //Expected Results
            List<Reservation> expectedReservationList = null;

            //Actions
            Assert.AreEqual(expectedReservationList, upcomingReservations, "Reservation List with Date In Past");
        }
    }
}
