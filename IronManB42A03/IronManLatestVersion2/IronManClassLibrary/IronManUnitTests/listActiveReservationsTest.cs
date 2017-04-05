using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
using System.Collections.Generic;
using System.Linq;

namespace IronManUnitTests
{
    [TestClass]
    public class ListActiveReservationsTest
    {
        [TestMethod]
        public void TestActiveReservationWithOwnerNumber()
        {
            //setup
            Reservation newRes = new Reservation();
            List<Reservation> activeReservations = newRes.listActiveReservations(7, Convert.ToDateTime("03/02/2017"), Convert.ToDateTime("03/03/2017"));

            //expected results 

            //reservation
            int expectedReservationNumber = 605;
            String expectedCustomerName = "Peter Piper";
            DateTime expectedStartDate = Convert.ToDateTime("03/01/2017");
            DateTime expectedEndDate = Convert.ToDateTime("03/07/2017");

            //first Pet
            int expectedPetNumber1 = 11;
            int expectedRunNumber1 = 0;
            String expectedPetName1 = "Max";

            //second pet
            int expectedPetNumber2 = 12;
            int expectedRunNumber2 = 0;
            String expectedPetName2 = "Kitoo";

            int expectedListSize = 1;

            //actions

            //reservation
            Assert.AreEqual(expectedReservationNumber, activeReservations.ElementAt(0).reservationNumber, "Reservation Number 1 Reservation With Owner Number");
            Assert.AreEqual(expectedCustomerName, activeReservations.ElementAt(0).owner.ownerFirstName + " " + activeReservations.ElementAt(0).owner.ownerLastName);
            Assert.AreEqual(expectedStartDate, activeReservations.ElementAt(0).reservationStartDate);
            Assert.AreEqual(expectedEndDate, activeReservations.ElementAt(0).reservationEndDate);

            //first pet reservation
            Assert.AreEqual(expectedPetNumber1, activeReservations.ElementAt(0).petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation First Pet Reservation");
            Assert.AreEqual(expectedRunNumber1, activeReservations.ElementAt(0).petReservation.ElementAt(0).runNumber, "Run Number 1 Reservation First Pet Reservation");
            Assert.AreEqual(expectedPetName1, activeReservations.ElementAt(0).petReservation.ElementAt(0).pet.petName, "Pet Name 1 Reservation First Pet Reservation");

            //second pet reservation
            Assert.AreEqual(expectedPetNumber2, activeReservations.ElementAt(0).petReservation.ElementAt(1).pet.petNumber, "Pet Number 2 Reservation Second Pet Reservation");
            Assert.AreEqual(expectedRunNumber2, activeReservations.ElementAt(0).petReservation.ElementAt(1).runNumber, "Run Number 1 Reservation First Pet Reservation");
            Assert.AreEqual(expectedPetName2, activeReservations.ElementAt(0).petReservation.ElementAt(1).pet.petName, "Pet Name 2 Reservation Second Pet Reservation");

            //List Size
            Assert.AreEqual(expectedListSize, activeReservations.Count, "List size owner number provided");
        }

        [TestMethod]
        public void TestActiveReservationNoOwnerNumber()
        {
            //setup
            Reservation newRes = new Reservation();
            List<Reservation> activeReservations = newRes.listActiveReservations(-1, Convert.ToDateTime("03/02/2017"), Convert.ToDateTime("03/03/2017"));

            int expectedListSize = 3;

            /** Third Reservation **/

            //expected results
            int res1expectedReservationNumber = 605;
            String res1expectedCustomerName = "Peter Piper";
            DateTime res1expectedStartDate = Convert.ToDateTime("03/01/2017");
            DateTime res1expectedEndDate = Convert.ToDateTime("03/07/2017");

            //first Pet
            int res1expectedPetNumber1 = 11;
            int res1expectedRunNumber1 = 0;
            String res1expectedPetName1 = "Max";

            //second pet
            int res1expectedPetNumber2 = 12;
            int res1expectedRunNumber2 = 0;
            String res1expectedPetName2 = "Kitoo";

            //actions

            //reservation
            Assert.AreEqual(res1expectedReservationNumber, activeReservations.ElementAt(2).reservationNumber, "Reservation Number 1 Reservation With Owner Number");
            Assert.AreEqual(res1expectedCustomerName, activeReservations.ElementAt(2).owner.ownerFirstName + " " + activeReservations.ElementAt(2).owner.ownerLastName);
            Assert.AreEqual(res1expectedStartDate, activeReservations.ElementAt(2).reservationStartDate);
            Assert.AreEqual(res1expectedEndDate, activeReservations.ElementAt(2).reservationEndDate);

            //first pet reservation
            Assert.AreEqual(res1expectedPetNumber1, activeReservations.ElementAt(2).petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation First Pet Reservation");
            Assert.AreEqual(res1expectedRunNumber1, activeReservations.ElementAt(2).petReservation.ElementAt(0).runNumber, "Run Number 1 Reservation First Pet Reservation");
            Assert.AreEqual(res1expectedPetName1, activeReservations.ElementAt(2).petReservation.ElementAt(0).pet.petName, "Pet Name 1 Reservation First Pet Reservation");

            //second pet reservation
            Assert.AreEqual(res1expectedPetNumber2, activeReservations.ElementAt(2).petReservation.ElementAt(1).pet.petNumber, "Pet Number 2 Reservation Second Pet Reservation");
            Assert.AreEqual(res1expectedRunNumber2, activeReservations.ElementAt(2).petReservation.ElementAt(1).runNumber, "Run Number 2 Reservation Second Pet Reservation");
            Assert.AreEqual(res1expectedPetName2, activeReservations.ElementAt(2).petReservation.ElementAt(1).pet.petName, "Pet Name 2 Reservation Second Pet Reservation");

            /** Second Reservation **/

            //expected results
            int res2expectedReservationNumber = 603;
            String res2expectedCustomerName = "Polly Morfek";
            DateTime res2expectedStartDate = Convert.ToDateTime("03/01/2017");
            DateTime res2expectedEndDate = Convert.ToDateTime("03/07/2017");

            //first Pet
            int res2expectedPetNumber1 = 31;
            int res2expectedRunNumber1 = 0;
            String res2expectedPetName1 = "Sam";

            //second pet
            int res2expectedPetNumber2 = 32;
            int res2expectedRunNumber2 = 0;
            String res2expectedPetName2 = "Snoop Dogg";

            //actions

            //reservation
            Assert.AreEqual(res2expectedReservationNumber, activeReservations.ElementAt(1).reservationNumber, "Reservation Number 1 Reservation With Owner Number");
            Assert.AreEqual(res2expectedCustomerName, activeReservations.ElementAt(1).owner.ownerFirstName + " " + activeReservations.ElementAt(1).owner.ownerLastName);
            Assert.AreEqual(res2expectedStartDate, activeReservations.ElementAt(1).reservationStartDate);
            Assert.AreEqual(res2expectedEndDate, activeReservations.ElementAt(1).reservationEndDate);

            //first pet reservation
            Assert.AreEqual(res2expectedPetNumber1, activeReservations.ElementAt(1).petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation First Pet Reservation");
            Assert.AreEqual(res2expectedRunNumber1, activeReservations.ElementAt(1).petReservation.ElementAt(0).runNumber, "Run Number 1 Reservation First Pet Reservation");
            Assert.AreEqual(res2expectedPetName1, activeReservations.ElementAt(1).petReservation.ElementAt(0).pet.petName, "Pet Name 1 Reservation First Pet Reservation");

            //second pet reservation
            Assert.AreEqual(res2expectedPetNumber2, activeReservations.ElementAt(1).petReservation.ElementAt(1).pet.petNumber, "Pet Number 2 Reservation Second Pet Reservation");
            Assert.AreEqual(res2expectedRunNumber2, activeReservations.ElementAt(1).petReservation.ElementAt(1).runNumber, "Run Number 2 Reservation Second Pet Reservation");
            Assert.AreEqual(res2expectedPetName2, activeReservations.ElementAt(1).petReservation.ElementAt(1).pet.petName, "Pet Name 2 Reservation Second Pet Reservation");

            /** First Reservation **/

            //expected results

            int res3expectedReservationNumber = 601;
            String res3expectedCustomerName = "Bayo Wolfe";
            DateTime res3expectedStartDate = Convert.ToDateTime("03/01/2017");
            DateTime res3expectedEndDate = Convert.ToDateTime("03/07/2017");

            //first Pet
            int res3expectedPetNumber1 = 26;
            int res3expectedRunNumber1 = 0;
            String res3expectedPetName1 = "Skarpa";

            //second pet
            int res3expectedPetNumber2 = 27;
            int res3expectedRunNumber2 = 0;
            String res3expectedPetName2 = "Bothvar";

            //actions

            //reservation
            Assert.AreEqual(res3expectedReservationNumber, activeReservations.ElementAt(0).reservationNumber, "Reservation Number 1 Reservation With Owner Number");
            Assert.AreEqual(res3expectedCustomerName, activeReservations.ElementAt(0).owner.ownerFirstName + " " + activeReservations.ElementAt(0).owner.ownerLastName);
            Assert.AreEqual(res3expectedStartDate, activeReservations.ElementAt(0).reservationStartDate);
            Assert.AreEqual(res3expectedEndDate, activeReservations.ElementAt(0).reservationEndDate);

            //first pet reservation
            Assert.AreEqual(res3expectedPetNumber1, activeReservations.ElementAt(0).petReservation.ElementAt(0).pet.petNumber, "Pet Number 1 Reservation First Pet Reservation");
            Assert.AreEqual(res3expectedRunNumber1, activeReservations.ElementAt(0).petReservation.ElementAt(0).runNumber, "Run Number 1 Reservation First Pet Reservation");
            Assert.AreEqual(res3expectedPetName1, activeReservations.ElementAt(0).petReservation.ElementAt(0).pet.petName, "Pet Name 1 Reservation First Pet Reservation");

            //second pet reservation
            Assert.AreEqual(res3expectedPetNumber2, activeReservations.ElementAt(0).petReservation.ElementAt(1).pet.petNumber, "Pet Number 2 Reservation Second Pet Reservation");
            Assert.AreEqual(res3expectedRunNumber2, activeReservations.ElementAt(0).petReservation.ElementAt(1).runNumber, "Run Number 2 Reservation Second Pet Reservation");
            Assert.AreEqual(res3expectedPetName2, activeReservations.ElementAt(0).petReservation.ElementAt(1).pet.petName, "Pet Name 2 Reservation Second Pet Reservation");

            //List Size
            Assert.AreEqual(expectedListSize, activeReservations.Count);
        }
    }
}
