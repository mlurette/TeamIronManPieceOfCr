using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
using System.Collections.Generic;
using System.Linq;

namespace IronManUnitTests
{
    [TestClass]
    public class ListOwnersTest
    {
        [TestMethod]
        public void TestListOwners()
        {
            //Setup
            Owner newOwn = new Owner();
            List<Owner> owners = newOwn.listOwners();
           
            //Expected Results
            String expectedCustomer1 = "Alibi, Anita";
            String expectedCustomer2 = "Berube, Cody";
            String expectedCustomer3 = "Bilhome, Moe";
            String expectedCustomer4 = "Coate, Mahatma";
            String expectedCustomer5 = "Drawers, Chester";
            String expectedCustomer6 = "Linn, Amanda";
            String expectedCustomer7 = "Mehome, Carrie";
            String expectedCustomer8 = "Mentary, Ella";
            String expectedCustomer9 = "Metu, Sue";
            String expectedCustomer10 = "Morfek, Polly";
            String expectedCustomer11 = "O'Phone, Mike";
            String expectedCustomer12 = "Ovar, Sam";
            String expectedCustomer13 = "Pepper, Salton";
            String expectedCustomer14 = "Piper, Peter";
            String expectedCustomer15 = "Que, Barb B.";
            String expectedCustomer16 = "Showers, April";
            String expectedCustomer17 = "Smith, Jane";
            String expectedCustomer18 = "Summers, Jeff";
            String expectedCustomer19 = "Wolfe, Bayo";
            String expectedCustomer20 = "Wong, Dwight";

            int expectedSize = 20;

            //Actions
            Assert.AreEqual(expectedCustomer1, owners.ElementAt(0).ownerLastName + ", " + owners.ElementAt(0).ownerFirstName, "Customer 1");
            Assert.AreEqual(expectedCustomer2, owners.ElementAt(1).ownerLastName + ", " + owners.ElementAt(1).ownerFirstName, "Customer 2");
            Assert.AreEqual(expectedCustomer3, owners.ElementAt(2).ownerLastName + ", " + owners.ElementAt(2).ownerFirstName, "Customer 3");
            Assert.AreEqual(expectedCustomer4, owners.ElementAt(3).ownerLastName + ", " + owners.ElementAt(3).ownerFirstName, "Customer 4");
            Assert.AreEqual(expectedCustomer5, owners.ElementAt(4).ownerLastName + ", " + owners.ElementAt(4).ownerFirstName, "Customer 5");
            Assert.AreEqual(expectedCustomer6, owners.ElementAt(5).ownerLastName + ", " + owners.ElementAt(5).ownerFirstName, "Customer 6");
            Assert.AreEqual(expectedCustomer7, owners.ElementAt(6).ownerLastName + ", " + owners.ElementAt(6).ownerFirstName, "Customer 7");
            Assert.AreEqual(expectedCustomer8, owners.ElementAt(7).ownerLastName + ", " + owners.ElementAt(7).ownerFirstName, "Customer 8");
            Assert.AreEqual(expectedCustomer9, owners.ElementAt(8).ownerLastName + ", " + owners.ElementAt(8).ownerFirstName, "Customer 9");
            Assert.AreEqual(expectedCustomer10, owners.ElementAt(9).ownerLastName + ", " + owners.ElementAt(9).ownerFirstName, "Customer 10");
            Assert.AreEqual(expectedCustomer11, owners.ElementAt(10).ownerLastName + ", " + owners.ElementAt(10).ownerFirstName, "Customer 11");
            Assert.AreEqual(expectedCustomer12, owners.ElementAt(11).ownerLastName + ", " + owners.ElementAt(11).ownerFirstName, "Customer 12");
            Assert.AreEqual(expectedCustomer13, owners.ElementAt(12).ownerLastName + ", " + owners.ElementAt(12).ownerFirstName, "Customer 13");
            Assert.AreEqual(expectedCustomer14, owners.ElementAt(13).ownerLastName + ", " + owners.ElementAt(13).ownerFirstName, "Customer 14");
            Assert.AreEqual(expectedCustomer15, owners.ElementAt(14).ownerLastName + ", " + owners.ElementAt(14).ownerFirstName, "Customer 15");
            Assert.AreEqual(expectedCustomer16, owners.ElementAt(15).ownerLastName + ", " + owners.ElementAt(15).ownerFirstName, "Customer 16");
            Assert.AreEqual(expectedCustomer17, owners.ElementAt(16).ownerLastName + ", " + owners.ElementAt(16).ownerFirstName, "Customer 17");
            Assert.AreEqual(expectedCustomer18, owners.ElementAt(17).ownerLastName + ", " + owners.ElementAt(17).ownerFirstName, "Customer 18");
            Assert.AreEqual(expectedCustomer19, owners.ElementAt(18).ownerLastName + ", " + owners.ElementAt(18).ownerFirstName, "Customer 19");
            Assert.AreEqual(expectedCustomer20, owners.ElementAt(19).ownerLastName + ", " + owners.ElementAt(19).ownerFirstName, "Customer 20");

            Assert.AreEqual(expectedSize, owners.Count);
        }
    }
}
