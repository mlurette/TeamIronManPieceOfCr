using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkDB;

using System.Data;

namespace IronManUnitTests
{
    [TestClass]
    public class ReservationMethodsDBTest
    {
        [TestMethod]
        public void TestNoConflicting()
        {
            //setup
            PetReservationDB conflict = new PetReservationDB();
            DateTime expectedStart = Convert.ToDateTime("11/15/2017");
            DateTime expectedEnd = Convert.ToDateTime("11/25/2017");

            //expected values
            int expectedRowsReturned = 0;

            //actions
            DataSet ds1 = conflict.checkConflictingReservationDB(12, expectedStart, expectedEnd);

            int actualRowsReturned = ds1.Tables[0].Rows.Count;

            Assert.AreEqual(expectedRowsReturned, actualRowsReturned);
        }

        [TestMethod]
        public void TestReservationInsert()
        {
            //setup
            ReservationDB reservationTest = new ReservationDB();
            DateTime date1 = new DateTime(2017, 12, 30);
            DateTime date2 = new DateTime(2017, 12, 31);

            //expected values
            int expectedRowsReturned = 1;
            int expectedResNum = 2023;
            DateTime expectedStart = Convert.ToDateTime("12/30/2017");
            DateTime expectedEnd = Convert.ToDateTime("12/31/2017");

            //actions
            reservationTest.addReservationDB(date1, date2);
            DataSet ds1 = reservationTest.getEmptyReservationDB(2023);
            DataTable dt1 = ds1.Tables[0];
            DataRow dr1 = dt1.Rows[0];

            int actualRowsReturned = ds1.Tables[0].Rows.Count;
            int actualResNum = Convert.ToInt32(dr1["RESERVATION_NUMBER"].ToString());
            DateTime actualResStart = Convert.ToDateTime(dr1["RESERVATION_START_DATE"].ToString());
            DateTime actualResEnd = Convert.ToDateTime(dr1["RESERVATION_END_DATE"].ToString());

            Assert.AreEqual(expectedRowsReturned, actualRowsReturned);
            Assert.AreEqual(expectedResNum, actualResNum);
            Assert.AreEqual(expectedStart, actualResStart);
            Assert.AreEqual(expectedEnd, actualResEnd);
        }

        [TestMethod]
        public void TestPetReservationInsert()
        {
            //setup
            PetReservationDB petRes = new PetReservationDB();
            int petNum = 11;

            //expected values
            int expectedRowsReturned = 1;
            int expectedResNum = 2023;
            int expectedPetResNum = 2512;
            int expectedPetNum = 11;

            //actions
            petRes.addToReservationDB(petNum);
            DataSet ds1 = petRes.getPetReservationDB(2512);
            DataTable dt1 = ds1.Tables[0];
            DataRow dr1 = dt1.Rows[0];

            int actualRowsReturned = ds1.Tables[0].Rows.Count;
            int actualResNum = Convert.ToInt32(dr1["RES_RESERVATION_NUMBER"].ToString());
            int actualPetNum = Convert.ToInt32(dr1["PET_PET_NUMBER"].ToString());
            int actualPetResNumber = Convert.ToInt32(dr1["PET_RES_NUMBER"].ToString());

            Assert.AreEqual(expectedRowsReturned, actualRowsReturned);
            Assert.AreEqual(expectedResNum, actualResNum);
            Assert.AreEqual(expectedPetNum, actualPetNum);
            Assert.AreEqual(expectedPetResNum, actualPetResNumber);
        }


        [TestMethod]
        public void TestPetReservationServiceInsert()
        {
            //setup
            PetReservationDB petRes = new PetReservationDB();
            int service = 1;

            //expected values
            int expectedRowsReturned = 1;
            int expectedPetResNum = 2506;
            int expectedServiceNum = 1;

            //actions
            petRes.insertPetReservationServiceDB(service);
            DataSet ds1 = petRes.getPetReservationServiceDB(2506);
            DataTable dt1 = ds1.Tables[0];
            DataRow dr1 = dt1.Rows[0];

            int actualRowsReturned = ds1.Tables[0].Rows.Count;
            int actualServiceNum = Convert.ToInt32(dr1["SERV_SERVICE_NUMBER"].ToString());
            int actualPetResNum = Convert.ToInt32(dr1["PR_PET_RES_NUMBER"].ToString());

            Assert.AreEqual(expectedRowsReturned, actualRowsReturned);
            Assert.AreEqual(expectedPetResNum, actualPetResNum);
            Assert.AreEqual(expectedServiceNum, actualServiceNum);
        }


        [TestMethod]
        public void TestOtherPetInsert()
        {
            //setup
            PetReservationDB petRes = new PetReservationDB();
            int petNum = 12;
            int resNum = 2023;
            //expected values
            int expectedRowsReturned = 1;
            int expectedResNum = 2023;
            int expectedPetResNum = 2513;
            int expectedPetNum = 12;

            //actions
            petRes.addToReservationDB(petNum, resNum);
            DataSet ds1 = petRes.getPetReservationDB(2513);
            DataTable dt1 = ds1.Tables[0];
            DataRow dr1 = dt1.Rows[0];

            int actualRowsReturned = ds1.Tables[0].Rows.Count;
            int actualResNum = Convert.ToInt32(dr1["RES_RESERVATION_NUMBER"].ToString());
            int actualPetNum = Convert.ToInt32(dr1["PET_PET_NUMBER"].ToString());
            int actualPetResNumber = Convert.ToInt32(dr1["PET_RES_NUMBER"].ToString());

            Assert.AreEqual(expectedRowsReturned, actualRowsReturned);
            Assert.AreEqual(expectedResNum, actualResNum);
            Assert.AreEqual(expectedPetNum, actualPetNum);
            Assert.AreEqual(expectedPetResNum, actualPetResNumber);
        }

        [TestMethod]
        public void TestChangeReservation()
        {
            //setup
            ReservationDB res = new ReservationDB();
            int resNum = 2018;
            DateTime start = Convert.ToDateTime("11/20/2017");
            DateTime end = Convert.ToDateTime("11/25/2017");

            //expected values
            int expectedRowsReturned = 1;
            int expectedResNum = 2018;
            DateTime expectedStart = Convert.ToDateTime("11/20/2017");
            DateTime expectedEnd = Convert.ToDateTime("11/25/2017");
            
            //actions
            res.changeReservationDB(resNum, start, end);
            DataSet ds1 = res.getReservationDB(2018);
            DataTable dt1 = ds1.Tables[0];
            DataRow dr1 = dt1.Rows[0];

            int actualRowsReturned = ds1.Tables[0].Rows.Count;
            int actualResNum = Convert.ToInt32(dr1["RESERVATION_NUMBER"].ToString());
            DateTime actualResStart = Convert.ToDateTime(dr1["RESERVATION_START_DATE"].ToString());
            DateTime actualResEnd = Convert.ToDateTime(dr1["RESERVATION_END_DATE"].ToString());

            Assert.AreEqual(expectedRowsReturned, actualRowsReturned);
            Assert.AreEqual(expectedResNum, actualResNum);
            Assert.AreEqual(expectedStart, actualResStart);
            Assert.AreEqual(expectedEnd, actualResEnd);
        }

        [TestMethod]
        public void TestConflicting()
        {
            //setup
            PetReservationDB conflict = new PetReservationDB();
            DateTime expectedStart = Convert.ToDateTime("12/30/2017");
            DateTime expectedEnd = Convert.ToDateTime("12/31/2017");

            //expected values
            int expectedRowsReturned = 1;
            int expectedResNum = 2023;

            //actions
            DataSet ds1 = conflict.checkConflictingReservationDB(12, expectedStart, expectedEnd);
            DataTable dt1 = ds1.Tables[0];
            DataRow dr1 = dt1.Rows[0];

            int actualResNum = Convert.ToInt32(dr1["RESERVATION_NUMBER"].ToString());
            int actualRowsReturned = ds1.Tables[0].Rows.Count;

            Assert.AreEqual(expectedRowsReturned, actualRowsReturned);
            Assert.AreEqual(expectedResNum, actualResNum);
        }

        [TestMethod]
        public void TestDeletePetFromReservation()
        {
            //setup
            ReservationDB res = new ReservationDB();
            PetReservationDB petRes = new PetReservationDB();
            int resNum = 2018;
            int petNum = 11;
            //expected values

            int expectedRowsReturned = 0;

            //actions
            res.deleteDogFromReservation(resNum, petNum);
            DataSet ds1 = petRes.getSinglePetReservationDB(11, 2018);
            
            int actualRowsReturned = ds1.Tables[0].Rows.Count;
            Assert.AreEqual(expectedRowsReturned, actualRowsReturned);
        }


        //[TestMethod]
        public void TestCancelReservation()
        {
            //setup
            ReservationDB res = new ReservationDB();
            int resNum = 2018;
            //expected values
            int expectedRowsReturned = 0;

            //actions
            res.cancelReservationDB(resNum);
            DataSet ds1 = res.getReservationDB(2018);

            int actualRowsReturned = ds1.Tables[0].Rows.Count;
            Assert.AreEqual(expectedRowsReturned, actualRowsReturned);
        }
    }
}
