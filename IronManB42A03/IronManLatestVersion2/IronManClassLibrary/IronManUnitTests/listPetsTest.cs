using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
using System.Collections.Generic;
using System.Linq;

namespace IronManUnitTests
{
    [TestClass]
    public class ListPetsTest
    {
        [TestMethod]
        public void TestOnePet()
        {
            //setup
            Pet newPet = new Pet();
            List<Pet> pets = newPet.listPets(3);

            //Expected Results
            int expectedOwnerNumber = 3;
            int expectedPetNumber = 13;
            String expectedPetName = "Logan";
            int expectedListSize = 1;

            //actions
            Assert.AreEqual(expectedOwnerNumber, pets.ElementAt(0).customerNumber, "Owner Number 1 Pet");
            Assert.AreEqual(expectedPetNumber, pets.ElementAt(0).petNumber, "Pet Number 1 Pet");
            Assert.AreEqual(expectedPetName, pets.ElementAt(0).petName, "Pet Name 1 Pet");
            Assert.AreEqual(expectedListSize, pets.Count, "List Size 1 Pet");
        }

        [TestMethod]
        public void TestMultiplePets()
        {
            //setup
            Pet newPet = new Pet();
            List<Pet> pets = newPet.listPets(2);

            //Expected Results
            int expectedOwnerNumber = 2;
            int expectedPet1Number = 6;
            int expectedPet2Number = 3;
            String expectedPet1Name = "Huxley";
            String expectedPet2Name = "Jasper";
            int expectedListSize = 2;

            //actions
            Assert.AreEqual(expectedOwnerNumber, pets.ElementAt(0).customerNumber, "Owner Number First Pet");
            Assert.AreEqual(expectedOwnerNumber, pets.ElementAt(1).customerNumber, "Owner Number Second Pet");
            Assert.AreEqual(expectedPet1Number, pets.ElementAt(0).petNumber, "First Pet Number");
            Assert.AreEqual(expectedPet2Number, pets.ElementAt(1).petNumber, "Second Pet Number");
            Assert.AreEqual(expectedPet1Name, pets.ElementAt(0).petName, "First Pet Name");
            Assert.AreEqual(expectedPet2Name, pets.ElementAt(1).petName, "Second Pet Name");
            Assert.AreEqual(expectedListSize, pets.Count, "List Size 2 Pets");
        }

        [TestMethod]
        public void TestNoPets()
        {
            //setup
            Pet newPet = new Pet();
            List<Pet> pets = newPet.listPets(5);

            //Expected Results
            List<Pet> expectedList = null;

            Assert.AreEqual(expectedList, pets, "No Pets List Null");
        }

        [TestMethod]
        public void TestInvalidOwnerNumber()
        {
            //setup
            Pet newPet = new Pet();
            List<Pet> pets = newPet.listPets(21);

            //Expected Results
            List<Pet> expectedList = null;

            Assert.AreEqual(expectedList, pets, "Invalid Owner Number Null List");
        }
    }
}
