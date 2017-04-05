using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkDB;
namespace IronManUnitTests
{
    [TestClass]
    public class LargeRunAvailableDBTest
    {
        [TestMethod]
        public void TestNoLargeRunsAvailable()
        {
            //setup
            PetRunDB petRun = new PetRunDB();

            //expected results
            int largeRunsAvailable = 0;

            //actions

            Assert.AreEqual(largeRunsAvailable, petRun.largeRunAvailableDB(Convert.ToDateTime("10/15/2017")), "No large runs available");
        }

        [TestMethod]
        public void TestLargeRunsAvailable()
        {
            //setup
            PetRunDB petRun = new PetRunDB();

            //expected results
            int largeRunsAvailable = 6;

            //actions

            Assert.AreEqual(largeRunsAvailable, petRun.largeRunAvailableDB(Convert.ToDateTime("10/01/2017")), "No large runs available");
        }
    }
}
