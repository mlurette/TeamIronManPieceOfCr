using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
using System.Collections.Generic;
using System.Linq;

namespace IronManUnitTests
{
    [TestClass]
    public class ListReservationsTest
    {
        [TestMethod]
        public void TestOneReservation()
        {
            //setup
            Reservation newRes = new Reservation();
            List<Reservation> customerReservations = newRes.listReservations(10);

            //expected results 
            int expectedReservationNumber = 700;
            int expectedPetNumber = 16;
            String expectedPetName = "Maggie";
            DateTime expectedStartDate = Convert.ToDateTime("01/10/2017");
            DateTime expectedEndDate = Convert.ToDateTime("01/12/2017");

            //actions
            Assert.AreEqual(expectedReservationNumber, customerReservations.ElementAt(0).reservationNumber, "Reservation Number 1 Reservation");
            Assert.AreEqual(expectedPetNumber, customerReservations.ElementAt(0).petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation");
            Assert.AreEqual(expectedPetName, customerReservations.ElementAt(0).petReservation.ElementAt(0).pet.petName, "Pet Name 1 Reservation");
            Assert.AreEqual(expectedStartDate, customerReservations.ElementAt(0).reservationStartDate, "Start Date 1 Reservation");
            Assert.AreEqual(expectedEndDate, customerReservations.ElementAt(0).reservationEndDate, "Start Date 1 Reservation");
        }

        [TestMethod]
        public void TestMultipleReservations()
        {
            //setup
            Reservation newRes = new Reservation();
            List<Reservation> customerReservations = newRes.listReservations(4);

            //expected results 
            //first reservation
            int expectedReservationNumber1 = 620;
            int expectedPetNumber1 = 7;
            String expectedPetName1 = "Charlie";
            DateTime expectedStartDate1 = Convert.ToDateTime("04/08/2016");
            DateTime expectedEndDate1 = Convert.ToDateTime("05/09/2016");

            //second reservation
            int expectedReservationNumber2 = 631;
            int expectedPetNumber2 = 7;
            String expectedPetName2 = "Charlie";
            DateTime expectedStartDate2 = Convert.ToDateTime("01/01/2016");
            DateTime expectedEndDate2 = Convert.ToDateTime("01/04/2016");

            //actions
            //first reservation
            Assert.AreEqual(expectedReservationNumber1, customerReservations.ElementAt(0).reservationNumber, "Reservation Number 1 Reservation");
            Assert.AreEqual(expectedPetNumber1, customerReservations.ElementAt(0).petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation");
            Assert.AreEqual(expectedPetName1, customerReservations.ElementAt(0).petReservation.ElementAt(0).pet.petName, "Pet Name 1 Reservation");
            Assert.AreEqual(expectedStartDate1, customerReservations.ElementAt(0).reservationStartDate, "Start Date 1 Reservation");
            Assert.AreEqual(expectedEndDate1, customerReservations.ElementAt(0).reservationEndDate, "Start Date 1 Reservation");

            //second reservation
            Assert.AreEqual(expectedReservationNumber2, customerReservations.ElementAt(1).reservationNumber, "Reservation Number 2 Reservation");
            Assert.AreEqual(expectedPetNumber2, customerReservations.ElementAt(1).petReservation.ElementAt(0).pet.petNumber, "Pet Number 2 Reservation");
            Assert.AreEqual(expectedPetName2, customerReservations.ElementAt(1).petReservation.ElementAt(0).pet.petName, "Pet Name 2 Reservation");
            Assert.AreEqual(expectedStartDate2, customerReservations.ElementAt(1).reservationStartDate, "Start Date 2 Reservation");
            Assert.AreEqual(expectedEndDate2, customerReservations.ElementAt(1).reservationEndDate, "Start Date 2 Reservation");
        }

        [TestMethod]
        public void TestNoReservations()
        {
            //setup
            Reservation newRes = new Reservation();
            List<Reservation> customerReservations = newRes.listReservations(250);

            //expected results 
            List<Reservation> expectedList = null;

            Assert.AreEqual(expectedList, customerReservations, "Owner has no future reservations. List is null");
        }

        [TestMethod]
        public void TestInvalidOwnerNumber()
        {
            //setup
            Reservation newRes = new Reservation();
            List<Reservation> customerReservations = newRes.listReservations(21);

            //Expected Results
            List<Reservation> expectedList = null;

            Assert.AreEqual(expectedList, customerReservations, "Invalid Owner Number Null List");
        }
    }
}
