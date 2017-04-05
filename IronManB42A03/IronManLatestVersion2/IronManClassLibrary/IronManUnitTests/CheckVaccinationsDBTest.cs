using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IronManhvkBLL;
using System.Collections.Generic;
using System.Linq;

namespace IronManUnitTests
{
    [TestClass]
    public class CheckVaccinationsDBTest
    {
        [TestMethod]
        public void AllCheckedTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.checkVaccinations(720, 3);

            //Expected Results
            List<Vaccination> expectedVaccinationList = null;

            //Actions
            Assert.AreEqual(expectedVaccinationList, vaccinations, "Null List When All Checked");
        }

        [TestMethod]
        public void NoneCheckedTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.checkVaccinations(708, 9);

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
            //DateTime expectedExpiryDate1 = Convert.ToDateTime("12/08/2017");
            //char expectedFlag1 = 'N';

            //Expected Vaccination 2
            String expectedVaccinationName2 = "Distemper";
            //DateTime expectedExpiryDate2 = Convert.ToDateTime("12/08/2017");
            //char expectedFlag2 = 'N';

            //Expected Vaccination 3
            String expectedVaccinationName3 = "Hepatitis";
            //DateTime expectedExpiryDate3 = Convert.ToDateTime("12/08/2017");
            //char expectedFlag3 = 'N';

            String expectedVaccinationName4 = "Parainfluenza";
            //DateTime expectedExpiryDate4 = Convert.ToDateTime("12/08/2017");
            //char expectedFlag4 = 'N';

            String expectedVaccinationName5 = "Parovirus";
            //DateTime expectedExpiryDate5 = Convert.ToDateTime("12/08/2017");
            //char expectedFlag5 = 'N';

            String expectedVaccinationName6 = "Rabies";
            //DateTime expectedExpiryDate6 = Convert.ToDateTime("12/08/2017");
            //char expectedFlag6 = 'N';

            //Actions
            Assert.AreEqual(expectedListSize, vaccinations.Count, "Vaccination List Size With None Checked");

            //vaccination 1 Action
            Assert.AreEqual(expectedVaccinationName1, vaccination1.vaccinationName, "Vaccination 1 Name - None Checked");
            //Assert.AreEqual(expectedExpiryDate1, vaccination1.vaccinationExpiryDate, "Vaccination 1 Expiry Date - None Checked");
            //Assert.AreEqual(expectedFlag1, vaccination1.vaccinationFlag, "Vaccination 1 Flag - None Checked");

            //vaccination 2 Action
            Assert.AreEqual(expectedVaccinationName2, vaccination2.vaccinationName, "Vaccination 2 Name- None Checked");
            //Assert.AreEqual(expectedExpiryDate2, vaccination2.vaccinationExpiryDate, "Vaccination 2 Expiry Date - None Checked");
            //Assert.AreEqual(expectedFlag2, vaccination2.vaccinationFlag, "Vaccination 2 Flag - None Checked");

            //vaccination 3 Action
            Assert.AreEqual(expectedVaccinationName3, vaccination3.vaccinationName, "Vaccination 3 Name - None Checked");
            //Assert.AreEqual(expectedExpiryDate3, vaccination3.vaccinationExpiryDate, "Vaccination 3 Expiry Date- None Checked");
            //Assert.AreEqual(expectedFlag3, vaccination3.vaccinationFlag, "Vaccination 3 Flag - None Checked");

            //vaccination 4 Action
            Assert.AreEqual(expectedVaccinationName4, vaccination4.vaccinationName, "Vaccination 4 Name - None Checked");
            //Assert.AreEqual(expectedExpiryDate4, vaccination4.vaccinationExpiryDate, "Vaccination 4 Expiry Date - None Checked");
            //Assert.AreEqual(expectedFlag4, vaccination4.vaccinationFlag, "Vaccination 4 Flag - None Checked");


            //vaccination 5 Action
            Assert.AreEqual(expectedVaccinationName5, vaccination5.vaccinationName, "Vaccination 5 Name - None Checked");
            //Assert.AreEqual(expectedExpiryDate5, vaccination5.vaccinationExpiryDate, "Vaccination 5 Expiry Date - None Checked");
            //Assert.AreEqual(expectedFlag5, vaccination5.vaccinationFlag, "Vaccination 5 Flag - None Checked");

            //vaccination 6 Action
            Assert.AreEqual(expectedVaccinationName6, vaccination6.vaccinationName, "Vaccination 6 Name - None Checked");
            //Assert.AreEqual(expectedExpiryDate6, vaccination6.vaccinationExpiryDate, "Vaccination 6 Expiry Date - None Checked");
            //Assert.AreEqual(expectedFlag6, vaccination6.vaccinationFlag, "Vaccination 6 Flag - None Checked");
        }

        [TestMethod]
        public void UncheckedAndMissingTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.checkVaccinations(625, 20);

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
            //DateTime expectedExpiryDate1 = Convert.ToDateTime("04/02/2018");
            //char expectedFlag1 = 'N';

            //Expected Vaccination 2
            String expectedVaccinationName2 = "Distemper";
            //DateTime expectedExpiryDate2 = Convert.ToDateTime("04/02/2018");
            //char expectedFlag2 = 'N';

            //Expected Vaccination 3
            String expectedVaccinationName3 = "Hepatitis"; //missing
            //DateTime expectedExpiryDate3 = new DateTime();
            //char expectedFlag3 = 'N';

            String expectedVaccinationName4 = "Parainfluenza"; //missing
            //DateTime expectedExpiryDate4 = new DateTime();
            //char expectedFlag4 = 'N';

            String expectedVaccinationName5 = "Parovirus";
            //DateTime expectedExpiryDate5 = Convert.ToDateTime("03/21/2018");
            //char expectedFlag5 = 'N';

            String expectedVaccinationName6 = "Rabies";
            //DateTime expectedExpiryDate6 = Convert.ToDateTime("06/02/2018");
            //char expectedFlag6 = 'N';

            //Actions
            Assert.AreEqual(expectedListSize, vaccinations.Count, "Vaccination List Size With Unchecked and Missing");

            //vaccination 1 Action
            Assert.AreEqual(expectedVaccinationName1, vaccination1.vaccinationName, "Vaccination 1 Name - Unchecked and Missing");
            //Assert.AreEqual(expectedExpiryDate1, vaccination1.vaccinationExpiryDate, "Vaccination 1 Expiry Date - Unchecked and Missing");
            //Assert.AreEqual(expectedFlag1, vaccination1.vaccinationFlag, "Vaccination 1 Flag  - Unchecked and Missing");

            //vaccination 2 Action
            Assert.AreEqual(expectedVaccinationName2, vaccination2.vaccinationName, "Vaccination 2 Name - Unchecked and Missing");
            //Assert.AreEqual(expectedExpiryDate2, vaccination2.vaccinationExpiryDate, "Vaccination 2 Expiry Date  - Unchecked and Missing");
            //Assert.AreEqual(expectedFlag2, vaccination2.vaccinationFlag, "Vaccination 2 Flag  - Unchecked and Missing");

            //vaccination 3 Action
            Assert.AreEqual(expectedVaccinationName3, vaccination3.vaccinationName, "Vaccination 3 Name  - Unchecked and Missing");
            //Assert.AreEqual(expectedExpiryDate3, vaccination3.vaccinationExpiryDate, "Vaccination 3 Expiry Date - Unchecked and Missing");
            //Assert.AreEqual(expectedFlag3, vaccination3.vaccinationFlag, "Vaccination 3 Flag  - Unchecked and Missing");

            //vaccination 4 Action
            Assert.AreEqual(expectedVaccinationName4, vaccination4.vaccinationName, "Vaccination 4 Name  - Unchecked and Missing");
            //Assert.AreEqual(expectedExpiryDate4, vaccination4.vaccinationExpiryDate, "Vaccination 4 Expiry Date  - Unchecked and Missing");
            //Assert.AreEqual(expectedFlag4, vaccination4.vaccinationFlag, "Vaccination 4 Flag  - Unchecked and Missing");


            //vaccination 5 Action
            Assert.AreEqual(expectedVaccinationName5, vaccination5.vaccinationName, "Vaccination 5 Name  - Unchecked and Missing");
            //Assert.AreEqual(expectedExpiryDate5, vaccination5.vaccinationExpiryDate, "Vaccination 5 Expiry Date  - Unchecked and Missing");
            //Assert.AreEqual(expectedFlag5, vaccination5.vaccinationFlag, "Vaccination 5 Flag  - Unchecked and Missing");

            //vaccination 6 Action
            Assert.AreEqual(expectedVaccinationName6, vaccination6.vaccinationName, "Vaccination 6 Name  - Unchecked and Missing");
            //Assert.AreEqual(expectedExpiryDate6, vaccination6.vaccinationExpiryDate, "Vaccination 6 Expiry Date  - Unchecked and Missing");
            //Assert.AreEqual(expectedFlag6, vaccination6.vaccinationFlag, "Vaccination 6 Flag  - Unchecked and Missing");
        }

        [TestMethod]
        public void InvalidResNumberTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.checkVaccinations(099, 3);

            //Expected Results
            List<Vaccination> expectedVaccinationList = null;

            //Actions
            Assert.AreEqual(expectedVaccinationList, vaccinations, "Null List When Invalid Res Number");
        }

        [TestMethod]
        public void PetNotInReservationTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.checkVaccinations(713, 14);

            //Expected Results
            List<Vaccination> expectedVaccinationList = null;

            //Actions
            Assert.AreEqual(expectedVaccinationList, vaccinations, "Null List When Pet Not In Reservation");
        }

        [TestMethod]
        public void ReservationCompletedAndInPastTest()
        {
            //Setup
            Vaccination newVacc = new Vaccination();
            List<Vaccination> vaccinations = newVacc.checkVaccinations(103, 6);

            //Expected Results
            List<Vaccination> expectedVaccinationList = null;

            //Actions
            Assert.AreEqual(expectedVaccinationList, vaccinations, "Null List When Reservation Complete");
        }
    }
}
