using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
namespace IronManUnitTests
{
    [TestClass]
    public class DeleteDogFromReservationTest
    {

        [TestMethod]
        public void TestValidPetInvalidRes()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.invalidReservationNumber;

            //action
            Assert.AreEqual(expectedCode, reservation.deleteDogFromReservation(1, 33));
        }

        [TestMethod]
        public void TestAllValidParameters()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, reservation.deleteDogFromReservation(2020, 12));
        }


        [TestMethod]
        public void TestDogNotInReservation()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.dogNotInReservation;

            //action
            Assert.AreEqual(expectedCode, reservation.deleteDogFromReservation(809, 7));
        }

        [TestMethod]
        public void TestDeleteReservation()
        {
            //setup
            Reservation reservation = new Reservation();
            
            //expected results
            Codes expectedCode = Codes.success;
            
            //action
            Assert.AreEqual(expectedCode, reservation.deleteDogFromReservation(2020, 11));
        }
    }
}
