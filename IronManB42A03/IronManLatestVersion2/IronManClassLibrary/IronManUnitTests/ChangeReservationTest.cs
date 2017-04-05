using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
namespace IronManUnitTests
{
    [TestClass]
    public class ChangeReservationTest
    {
        
        [TestMethod]
        public void TestInvalidReservationNumber()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.invalidReservationNumber;
            
            //action
            Assert.AreEqual(expectedCode, reservation.changeReservation(099, new DateTime(2015, 09, 12), new DateTime(2015, 09, 19)));
        }

        [TestMethod]
        public void TestInvalidStartDate()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.startDateInPast;

            //action
            Assert.AreEqual(expectedCode, reservation.changeReservation(100, new DateTime(1970, 01, 01), new DateTime(2015, 09, 13)));
        }

        [TestMethod]
        public void TestInvalidEndDate()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.startDateAfterEndDate;

            //action
            Assert.AreEqual(expectedCode, reservation.changeReservation(100, new DateTime(2015, 09, 19), new DateTime(2015, 09, 12)));

        }

        [TestMethod]
        public void TestRunUnavailability()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.noRunAvailable;

            //action
            Assert.AreEqual(expectedCode, reservation.changeReservation(110, new DateTime(2017, 10, 16), new DateTime(2017, 10, 17)));
        }

        [TestMethod]
        public void TestOverlappingReservation()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.petHasConflictingReservation;

            //action
            Assert.AreEqual(expectedCode, reservation.changeReservation(2021, new DateTime(2017, 12, 05), new DateTime(2017, 12, 08)));
        }

        [TestMethod]
        public void TestHappyPath()
        {
            //setup
            Reservation reservation = new Reservation();

            //expected results
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, reservation.changeReservation(2021, new DateTime(2017, 12, 20), new DateTime(2017, 12, 21)));
        }
    }
}
