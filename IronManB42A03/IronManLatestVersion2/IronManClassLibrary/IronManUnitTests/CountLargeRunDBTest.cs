using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkDB;
namespace IronManUnitTests
{
    [TestClass]
    public class CountLargeRunDBTest
    {
        [TestMethod]
        public void CountAllLargeRuns()
        {
            //setup 
            PetRunDB runs = new PetRunDB();

            //expected values
            int runAmount = 6;

            //actions
            Assert.AreEqual(runAmount, runs.countLargeRunsDB());
        }
    }
}
