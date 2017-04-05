using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkDB;

namespace IronManUnitTests
{
    [TestClass]
    public class CountAllRunsDBTest
    {
        [TestMethod]
        public void CountAllRuns()
        {
            //setup 
            PetRunDB runs = new PetRunDB();

            //expected values
            int runAmount = 12;

            //actions
            Assert.AreEqual(runAmount, runs.countAllRunsDB());
        }
    }
}
