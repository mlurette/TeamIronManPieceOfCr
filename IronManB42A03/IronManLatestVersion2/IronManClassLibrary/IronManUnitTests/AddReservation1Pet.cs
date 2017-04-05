using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
namespace IronManUnitTests
{
    [TestClass]
    public class AddReservation1Pet
    {
        [TestMethod]
        public void InvalidStartDateTest()
        {
            //Setup
            Reservation reservation = new Reservation();

            //Expected Results
            Codes expectedCode = Codes.startDateInPast;

            //Action
            Assert.AreEqual(expectedCode, reservation.addReservation(14, Convert.ToDateTime("03/31/2017"), Convert.ToDateTime("04/01/2017")));
        }

        [TestMethod]
        public void EndDateBeforeStartDateTest()
        {
            //Setup
            Reservation reservation = new Reservation();

            //Expected Results
            Codes expectedCode = Codes.startDateAfterEndDate;

            //Action
            Assert.AreEqual(expectedCode, reservation.addReservation(14, Convert.ToDateTime("04/01/2017"), Convert.ToDateTime("03/31/2017")));
        }

        [TestMethod]
        public void RegularRunAvailableTest()
        {
            //Setup
            Reservation reservation = new Reservation();
            //Expected Results
            Codes expectedCode = Codes.success;
            //Action
            Assert.AreEqual(expectedCode, reservation.addReservation(7, Convert.ToDateTime("11/01/2017"), Convert.ToDateTime("11/02/2017")));
        }

        [TestMethod]
        public void LargeRunAvailableTest()
        {
            //Setup
            Reservation reservation = new Reservation();
            //Expected Results
            Codes expectedCode = Codes.success;
            //Action
            Assert.AreEqual(expectedCode, reservation.addReservation(11, Convert.ToDateTime("11/01/2017"), Convert.ToDateTime("11/02/2017")));
        }

        [TestMethod]
        public void RegularRunNotAvailableTest()
        {
            //Setup
            Reservation reservation = new Reservation();
            PetRun petRun = new PetRun();
            //Expected Results
            Codes expectedCode = Codes.noRunAvailable;

            //Action
            Assert.AreEqual(expectedCode, reservation.addReservation(7, Convert.ToDateTime("09/16/2017"), Convert.ToDateTime("09/16/2017")));
        }

        [TestMethod]
        public void LargeRunNotAvailableTest()
        {
            //Setup
            Reservation reservation = new Reservation();
            PetRun petRun = new PetRun();
            //Expected Results
            Codes expectedCode = Codes.noRunAvailable;

            //Action
            Assert.AreEqual(expectedCode, reservation.addReservation(11, Convert.ToDateTime("10/16/2017"), Convert.ToDateTime("10/17/2017")));
        }
    }
}
