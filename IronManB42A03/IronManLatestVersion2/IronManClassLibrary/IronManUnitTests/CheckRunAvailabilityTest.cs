using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
namespace IronManUnitTests
{
    [TestClass]
    public class CheckRunAvailabilityTest
    {


        [TestMethod]
        public void TestLargeRunAvailable()
        {
            //setup
            PetRun petRun = new PetRun();

            //expected result
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, petRun.checkRunAvailability(Convert.ToDateTime("11/01/2017"), Convert.ToDateTime("11/02/2017"), 'L'));
        }

        [TestMethod]
        public void TestAllRunAvailable()
        {
            //setup
            PetRun petRun = new PetRun();

            //expected result
            Codes expectedCode = Codes.success;

            //action
            Assert.AreEqual(expectedCode, petRun.checkRunAvailability(Convert.ToDateTime("11/01/2017"), Convert.ToDateTime("11/02/2017"), 'R'));
        }

        [TestMethod]
        public void TestLargeRunNotAvailable()
        {
            //setup
            PetRun petRun = new PetRun();

            //expected result
            Codes expectedCode = Codes.noRunAvailable;

            //action
            Assert.AreEqual(expectedCode, petRun.checkRunAvailability(Convert.ToDateTime("10/16/2017"), Convert.ToDateTime("10/17/2017"), 'L'));
        }

        [TestMethod]
        public void TestNoRunAvailable()
        {
            //setup
            PetRun petRun = new PetRun();

            //expected result
            Codes expectedCode = Codes.noRunAvailable;

            //action
            Assert.AreEqual(expectedCode, petRun.checkRunAvailability(Convert.ToDateTime("09/16/2017"), Convert.ToDateTime("09/16/2017"), 'R'));
        }


        [TestMethod]
        public void TestStartDateAfterEndDate()
        {
            //setup
            PetRun petRun = new PetRun();

            //expected result
            Codes expectedCode = Codes.startDateAfterEndDate;

            //action
            Assert.AreEqual(expectedCode, petRun.checkRunAvailability(Convert.ToDateTime("09/17/2017"), Convert.ToDateTime("09/16/2017"), 'L'));
        }

        [TestMethod]
        public void TestStartDateInPast()
        {
            //setup
            PetRun petRun = new PetRun();

            //expected result
            Codes expectedCode = Codes.startDateInPast;

            //action
            Assert.AreEqual(expectedCode, petRun.checkRunAvailability(DateTime.Now.AddDays(-1), Convert.ToDateTime("09/16/2017"), 'L'));
        }
    }
}
