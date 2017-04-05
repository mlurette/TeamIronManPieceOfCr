using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkDB;
using System.Configuration;
using System.Data;

namespace IronManUnitTests
{
 

    [TestClass]
    public class AllRunsAvailableDBTest
    {
        [TestMethod]
        public void AllAvailableRunsTest()
        {
            //Run test on Standard HVK DB

            PetRunDB runTest = new PetRunDB();
            DateTime date1 = new DateTime(2017, 03, 17);
           // there are 3 reservations on March 17th,2017
            DateTime date2 = new DateTime(2017, 03, 29);
            ///there are no reservations on March 29th, 2017
           DateTime date3 = new DateTime(2017,09, 16);
            //there are 12 reservations on Sept 16th, 2017 <-run script

            int availableRuns1 = runTest.allRunAvailableDB(date1);
            int availableRuns2 = runTest.allRunAvailableDB(date2);
            int availableRuns3 = runTest.allRunAvailableDB(date3);

            Assert.AreEqual(9,availableRuns1, "Testing 9 available runs");
            Assert.AreEqual(12, availableRuns2, "Testing 12 available runs");
            Assert.AreEqual(0, availableRuns3, "Testing no available runs");
        }
    }
}
