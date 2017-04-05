using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;

namespace IronManUnitTests
{
    [TestClass]
    public class ScenarioTesting
    {
        [TestMethod]
        public void AddReservationStartDateInPastTest()
        {
            //setup
            Reservation reservation = new Reservation();
            int petNum = 31;
            DateTime date1 = new DateTime(2010, 03, 17);
            DateTime date2 = new DateTime(2020, 03, 20);

            //expected results
            Codes expectedCode = Codes.startDateInPast;

            //action
            Assert.AreEqual(expectedCode, reservation.addReservation(petNum, date1, date2));
        }

        [TestMethod]
        public void AddReservationEndDateBeforeStartDate()
        {
            //setup
            Reservation reservation = new Reservation();
            int petNum = 31;
            DateTime date1 = new DateTime(2020, 03, 17);
            DateTime date2 = new DateTime(2020, 02, 20);

            //expected results
            Codes expectedCode = Codes.startDateAfterEndDate;

            //action
            Assert.AreEqual(expectedCode, reservation.addReservation(petNum, date1, date2));
        }

        [TestMethod]
        public void AddReservationNoRunsAvailable()
        {

            //NOT WORKING!

            Reservation reservation = new Reservation();
            int petNum = 14;
            DateTime date1 = new DateTime(2017, 09, 16);
            DateTime date2 = new DateTime(2017, 09, 17);

            //expected results
            Codes expectedCode = Codes.noRunAvailable;

            //action
            Assert.AreEqual(expectedCode, reservation.addReservation(petNum, date1, date2));
        }



        [TestMethod]
        public void AddReservationAllValidTest()
        {
            //setup
            Reservation reservation = new Reservation();
            int petNum = 31;
            DateTime date1 = new DateTime(2020, 03, 17);
            DateTime date2 = new DateTime(2020, 03, 20);
            //expected results
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, reservation.addReservation(petNum, date1, date2));
        }

        [TestMethod]
        public void ChangeReservationStartDateBeforeEndDate()
        {
            //setup
            Reservation reservation = new Reservation();
            int resNum = 2021;
            DateTime date1 = new DateTime(2020, 03, 17);
            DateTime date2 = new DateTime(2020, 02, 20);

            //expected results
            Codes expectedCode = Codes.startDateAfterEndDate;

            //action
            Assert.AreEqual(expectedCode, reservation.changeReservation(resNum, date1, date2));
        }

        [TestMethod]
        public void ChangeReservationStartInPast()
        {
            //setup
            Reservation reservation = new Reservation();
            int resNum = 2021;
            DateTime date1 = new DateTime(2001, 03, 17);
            DateTime date2 = new DateTime(2020, 02, 20);

            //expected results
            Codes expectedCode = Codes.startDateInPast;

            //action
            Assert.AreEqual(expectedCode, reservation.changeReservation(resNum, date1, date2));
        }

        [TestMethod]
        public void ChangeReservationAllValid()
        {
            //setup
            Reservation reservation = new Reservation();
            int resNum = 2021;
            DateTime date1 = new DateTime(2020, 03, 17);
            DateTime date2 = new DateTime(2020, 04, 20);

            //expected results
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, reservation.changeReservation(resNum, date1, date2));
        }

        [TestMethod]
        public void CancelReservationInvalidResNumber()
        {
            //setup
            Reservation reservation = new Reservation();
            int resNum = 42;
            //expected results
            Codes expectedCode = Codes.invalidReservationNumber;

            //action
            Assert.AreEqual(expectedCode, reservation.cancelReservation(resNum));
        }

        [TestMethod]
        public void CancelReservationReservationInPast()
        {
            //setup
            //Requires changes to Reservation.cs (check 'em)
            Reservation reservation = new Reservation();
            int resNum = 100;

            //expected results
            Codes expectedCode = Codes.reservationInPast;

            //action
            Assert.AreEqual(expectedCode, reservation.cancelReservation(resNum));
        }

        [TestMethod]
        public void CancelReservationAllValid()
        {
            //setup
            Reservation reservation = new Reservation();
            int resNum = 2000;

            //expected results
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, reservation.cancelReservation(resNum));
        }

    }
}