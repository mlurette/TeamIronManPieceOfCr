using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
namespace IronManUnitTests
{
    [TestClass]
    public class AddToReservation1PetTest
    {        
        [TestMethod]
        public void ValidPetNumberInvalidResNumberTest()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected value
            Codes expectedCode = Codes.invalidReservationNumber;

            //action
            Assert.AreEqual(expectedCode, reservation.addToReservation(850, 6), "2 - Invalid reservation number, Valid pet number");
        }

        [TestMethod]
        public void PetAlreadyInReservationTest()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.petAlreadyInReservation;
           
            //action
            Assert.AreEqual(expectedCode, reservation.addToReservation(721, 3), "14 - Pet already in reservation");
        }

        [TestMethod]
        public void CompletedReservationTest()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.reservationInPast;

            //action
            Assert.AreEqual(expectedCode, reservation.addToReservation(100, 1), "10 - Reservation in the past");
        }

        [TestMethod]
        public void PetDoesNotMatchOwnerTest()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.dogHasDifferentOwner;

            //action
            Assert.AreEqual(expectedCode, reservation.addToReservation(721, 14), "9 - Pet does not belong to owner of reservation");
        }

        [TestMethod]
        public void RunNotAvailableTest()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.noRunAvailable;

            //action
            Assert.AreEqual(expectedCode, reservation.addToReservation(2015, 11), "6 - no run available");
        }

        [TestMethod]
        public void AllValidTest()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected result
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, reservation.addToReservation(809, 10), "0 - Success");
        }
    }
}
