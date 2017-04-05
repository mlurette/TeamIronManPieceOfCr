using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
namespace IronManUnitTests
{
    [TestClass]
    public class CancelReservationTest
    {
        [TestMethod]
        public void ValidReservationNumber()
        {
            //setup
            Reservation reservation = new Reservation();

            //Expected Result
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, reservation.cancelReservation(2018), "0 - Success");
        }

        [TestMethod]
        public void InvalidReservationNumber()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.invalidReservationNumber;
            //action
            Assert.AreEqual(expectedCode, reservation.cancelReservation(820), "2 - Invalid reservation number");
        }

        [TestMethod]
        public void ReservationInThePast()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.reservationInPast;

            //action
            Assert.AreEqual(expectedCode, reservation.cancelReservation(100), "2 - Invalid reservation number");
        }

        [TestMethod]
        public void ActiveReservationTest()
        {
            
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, reservation.cancelReservation(2019), "11 - active reservation");
        }
    }
}
