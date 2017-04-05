using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
using System.Collections.Generic;
using System.Linq;

namespace IronManUnitTests
{
    [TestClass]
    public class ListVaccinationsTest
    {
        [TestMethod]
        public void NoVaccinationsTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.listVaccinations(10);

            //Expected Results
            List<Vaccination> expectedVaccinationList = null;

            //Actions
            Assert.AreEqual(expectedVaccinationList, vaccinations, "Vaccination List With No Vaccinations");
        }

        [TestMethod]
        public void InvalidPetNumberTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.listVaccinations(50);

            //Expected Results
            List<Vaccination> expectedVaccinationList = null;

            //Actions
            Assert.AreEqual(expectedVaccinationList, vaccinations, "Vaccination List With Invalid Pet Number");
        }

        [TestMethod]
        public void AllVaccinationsTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.listVaccinations(2);

            //Expected Results
            int expectedListSize = 6;

            //Vaccinations
            Vaccination vaccination1 = vaccinations.ElementAt(0);
            Vaccination vaccination2 = vaccinations.ElementAt(1);
            Vaccination vaccination3 = vaccinations.ElementAt(2);
            Vaccination vaccination4 = vaccinations.ElementAt(3);
            Vaccination vaccination5 = vaccinations.ElementAt(4);
            Vaccination vaccination6 = vaccinations.ElementAt(5);

            //Expected Vaccination 1
            String expectedVaccinationName1 = "Bordetella";
            DateTime expectedExpiryDate1 = Convert.ToDateTime("03/05/2017");
            char expectedFlag1 = 'N';

            //Expected Vaccination 2
            String expectedVaccinationName2 = "Distemper";
            DateTime expectedExpiryDate2 = Convert.ToDateTime("03/05/2017");
            char expectedFlag2 = 'N';

            //Expected Vaccination 3
            String expectedVaccinationName3 = "Hepatitis";
            DateTime expectedExpiryDate3 = Convert.ToDateTime("03/05/2017");
            char expectedFlag3 = 'N';

            String expectedVaccinationName4 = "Parainfluenza";
            DateTime expectedExpiryDate4 = Convert.ToDateTime("03/05/2017");
            char expectedFlag4 = 'N';

            String expectedVaccinationName5 = "Parovirus";
            DateTime expectedExpiryDate5 = Convert.ToDateTime("03/05/2017");
            char expectedFlag5 = 'N';

            String expectedVaccinationName6 = "Rabies";
            DateTime expectedExpiryDate6 = Convert.ToDateTime("03/05/2018");
            char expectedFlag6 = 'N';

            //Actions
            Assert.AreEqual(expectedListSize, vaccinations.Count, "Vaccination List Size With All Vaccinations");

            //vaccination 1 Action
            Assert.AreEqual(expectedVaccinationName1, vaccination1.vaccinationName, "Vaccination 1 Name - All Vaccinations");
            Assert.AreEqual(expectedExpiryDate1, vaccination1.vaccinationExpiryDate, "Vaccination 1 Expiry Date  - All Vaccinations");
            Assert.AreEqual(expectedFlag1, vaccination1.vaccinationFlag, "Vaccination 1 Flag - All Vaccinations");

            //vaccination 2 Action
            Assert.AreEqual(expectedVaccinationName2, vaccination2.vaccinationName, "Vaccination 2 Name - All Vaccinations");
            Assert.AreEqual(expectedExpiryDate2, vaccination2.vaccinationExpiryDate, "Vaccination 2 Expiry Date - All Vaccinations");
            Assert.AreEqual(expectedFlag2, vaccination2.vaccinationFlag, "Vaccination 2 Flag - All Vaccinations");

            //vaccination 3 Action
            Assert.AreEqual(expectedVaccinationName3, vaccination3.vaccinationName, "Vaccination 3 Name - All Vaccinations");
            Assert.AreEqual(expectedExpiryDate3, vaccination3.vaccinationExpiryDate, "Vaccination 3 Expiry Date - All Vaccinations");
            Assert.AreEqual(expectedFlag3, vaccination3.vaccinationFlag, "Vaccination 3 Flag - All Vaccinations");

            //vaccination 4 Action
            Assert.AreEqual(expectedVaccinationName4, vaccination4.vaccinationName, "Vaccination 4 Name - All Vaccinations");
            Assert.AreEqual(expectedExpiryDate4, vaccination4.vaccinationExpiryDate, "Vaccination 4 Expiry Date - All Vaccinations");
            Assert.AreEqual(expectedFlag4, vaccination4.vaccinationFlag, "Vaccination 4 Flag - All Vaccinations");


            //vaccination 5 Action
            Assert.AreEqual(expectedVaccinationName5, vaccination5.vaccinationName, "Vaccination 5 Name - All Vaccinations");
            Assert.AreEqual(expectedExpiryDate5, vaccination5.vaccinationExpiryDate, "Vaccination 5 Expiry Date - All Vaccinations");
            Assert.AreEqual(expectedFlag5, vaccination5.vaccinationFlag, "Vaccination 5 Flag - All Vaccinations");

            //vaccination 6 Action
            Assert.AreEqual(expectedVaccinationName6, vaccination6.vaccinationName, "Vaccination 6 Name - All Vaccinations");
            Assert.AreEqual(expectedExpiryDate6, vaccination6.vaccinationExpiryDate, "Vaccination 6 Expiry Date - All Vaccinations");
            Assert.AreEqual(expectedFlag6, vaccination6.vaccinationFlag, "Vaccination 6 Flag - All Vaccinations");
        }

        [TestMethod]
        public void SomeVaccinationsTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.listVaccinations(14);

            //Expected Results
            int expectedListSize = 5;

            //Vaccinations
            Vaccination vaccination1 = vaccinations.ElementAt(0);
            Vaccination vaccination2 = vaccinations.ElementAt(1);
            Vaccination vaccination3 = vaccinations.ElementAt(2);
            Vaccination vaccination4 = vaccinations.ElementAt(3);
            Vaccination vaccination5 = vaccinations.ElementAt(4);

            //Expected Vaccination 1
            String expectedVaccinationName1 = "Bordetella";
            DateTime expectedExpiryDate1 = Convert.ToDateTime("2017/09/05");
            char expectedFlag1 = 'N';

            //Expected Vaccination 2
            String expectedVaccinationName2 = "Distemper";
            DateTime expectedExpiryDate2 = Convert.ToDateTime("2017/09/05");
            char expectedFlag2 = 'N';

            //Expected Vaccination 2
            String expectedVaccinationName3 = "Hepatitis";
            DateTime expectedExpiryDate3 = Convert.ToDateTime("2017/09/05");
            char expectedFlag3 = 'N';

            //Expected Vaccination 3
            String expectedVaccinationName4 = "Parainfluenza";
            DateTime expectedExpiryDate4 = Convert.ToDateTime("2017/09/05");
            char expectedFlag4 = 'N';

            String expectedVaccinationName5 = "Parovirus";
            DateTime expectedExpiryDate5 = Convert.ToDateTime("2017/09/05");
            char expectedFlag5 = 'N';

            //Actions

            Assert.AreEqual(expectedListSize, vaccinations.Count, "Vaccination List Size With Some Vaccinations");

            //vaccination 1 Action
            Assert.AreEqual(expectedVaccinationName1, vaccination1.vaccinationName, "Vaccination 1 Name - Some Vaccinations");
            Assert.AreEqual(expectedExpiryDate1, vaccination1.vaccinationExpiryDate, "Vaccination 1 Expiry Date - Some Vaccinations");
            Assert.AreEqual(expectedFlag1, vaccination1.vaccinationFlag, "Vaccination 1 Flag - Some Vaccinations");

            //vaccination 2 Action
            Assert.AreEqual(expectedVaccinationName2, vaccination2.vaccinationName, "Vaccination 2 Name - Some Vaccinations");
            Assert.AreEqual(expectedExpiryDate2, vaccination2.vaccinationExpiryDate, "Vaccination 2 Expiry Date  - Some Vaccinations");
            Assert.AreEqual(expectedFlag2, vaccination2.vaccinationFlag, "Vaccination 2 Flag  - Some Vaccinations");

            //vaccination 3 Action
            Assert.AreEqual(expectedVaccinationName3, vaccination3.vaccinationName, "Vaccination 3 Name  - Some Vaccinations");
            Assert.AreEqual(expectedExpiryDate3, vaccination3.vaccinationExpiryDate, "Vaccination 3 Expiry Date - Some Vaccinations");
            Assert.AreEqual(expectedFlag3, vaccination3.vaccinationFlag, "Vaccination 3 Flag - Some Vaccinations");

            //vaccination 4 Action
            Assert.AreEqual(expectedVaccinationName4, vaccination4.vaccinationName, "Vaccination 4 Name - Some Vaccinations");
            Assert.AreEqual(expectedExpiryDate4, vaccination4.vaccinationExpiryDate, "Vaccination 4 Expiry Date - Some Vaccinations");
            Assert.AreEqual(expectedFlag4, vaccination4.vaccinationFlag, "Vaccination 4 Flag - Some Vaccinations");
            
            //vaccination 5 Action
            Assert.AreEqual(expectedVaccinationName5, vaccination5.vaccinationName, "Vaccination 4 Name - Some Vaccinations");
            Assert.AreEqual(expectedExpiryDate5, vaccination5.vaccinationExpiryDate, "Vaccination 4 Expiry Date - Some Vaccinations");
            Assert.AreEqual(expectedFlag5, vaccination5.vaccinationFlag, "Vaccination 4 Flag - Some Vaccinations");

        }

    }
}
