using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IronManhvkDB;
using System.Data;
using System.ComponentModel;

namespace IronManhvkBLL
{
    public class Pet
    {
        public int petNumber { get; set; }
        public String petName { get; set; }
        public char petGender { get; set; }
        public char petFixed { get; set; }
        public String petBreed { get; set; }
        public DateTime petBirthdate { get; set; }
        public int customerNumber { get; set; }
        public char petSize { get; set; }
        public String petSpecialNotes { get; set; }
        public List<Vaccination> petVaccination { get; set; }

        public Pet()
        {
            petVaccination = new List<Vaccination>();
            petNumber = 0;
            petName = "";
            petGender = ' ';
            petFixed = ' ';
            petBreed = "";
            petBirthdate = DateTime.Now;
            customerNumber = 0;
            petSize = ' ';
            petSpecialNotes = "";
        }

        public Pet(int petNum, String name, char gender, char fix, int custNum)
        {
            petVaccination = new List<Vaccination>();
            petNumber = petNum;
            petName = name;
            petGender = gender;
            petFixed = fix;
            petBreed = "";
            petBirthdate = DateTime.Now;
            customerNumber = custNum;
            petSize = ' ';
            petSpecialNotes = "";
        }

        public Pet(int petNum, String name, char gender, char fix, int custNum, String breed, DateTime birthday, char size, String notes)
        {
            petVaccination = new List<Vaccination>();
            petNumber = petNum;
            petName = name;
            petGender = gender;
            petFixed = fix;
            petBreed = breed;
            petBirthdate = birthday;
            customerNumber = custNum;
            petSize = size;
            petSpecialNotes = notes;
        }

        public void addVaccination(Vaccination newVaccination)
        {
            petVaccination.Add(newVaccination);
        }

        public List<Pet> listPets(int ownerNumber)
        {
            PetDB petDB = new PetDB();
            DataSet pets = petDB.listPetsDB(ownerNumber);
            return getPets(pets.Tables[0], ownerNumber);
        }

        public List<Pet> getPets(DataTable petTable, int ownerNumber)
        {
            List<Pet> pets = new List<Pet>();

            foreach (DataRow row in petTable.Rows)
            {                
                int petNumber = Convert.ToInt32(row["PET_NUMBER"].ToString());
                String petName = row["PET_NAME"].ToString();
                char petGender = Convert.ToChar(row["PET_GENDER"].ToString());
                char petFixed = Convert.ToChar(row["PET_FIXED"].ToString());
                char petSize = Convert.ToChar(row["DOG_SIZE"].ToString());
                String petBreed = row["PET_BREED"].ToString();

                DateTime petBirthdate = DateTime.MinValue;

                if (row["PET_BIRTHDATE"].ToString() != "")
                {
                    petBirthdate = Convert.ToDateTime(row["PET_BIRTHDATE"]);
                }

                String petNotes = row["SPECIAL_NOTES"].ToString();
    
                pets.Add(new Pet(petNumber, petName, petGender, petFixed, ownerNumber, petBreed, petBirthdate, petSize, petNotes));
            }

            if(pets.Count == 0)
            {
                pets = null;
            }

            return pets;
        }

        public char getPetSize(int petNum)
        {
            PetDB petDB = new PetDB();
            DataSet dsPet = petDB.getPetSizeDB(petNum);
            DataTable dtPet = dsPet.Tables[0];
            DataRow drPet = dtPet.Rows[0];

            return  Convert.ToChar(drPet["DOG_SIZE"].ToString());
        }

        public int getPetOwner(int petNum)
        {
            PetDB petDB = new PetDB();
            DataSet dsOwner = petDB.getPetOwnerDB(petNum);
            DataTable dtOwner = dsOwner.Tables[0];
            DataRow drOwner = dtOwner.Rows[0];

            int ownerNum = Convert.ToInt32(drOwner["OWN_OWNER_NUMBER"].ToString());
            return ownerNum;
        }

        public char getPetGender(int petNum)
        {
            PetDB petDB = new PetDB();
            DataSet dsPetSize = petDB.getPetGenderDB(petNum);
            DataTable dtSize = dsPetSize.Tables[0];
            DataRow drSize = dtSize.Rows[0];

            char size = Convert.ToChar(drSize["PET_GENDER"].ToString());
            return size;
        }

        public char getPetFixed(int petNum)
        {
            PetDB petDB = new PetDB();
            DataSet dsPetSize = petDB.getPetFixedDB(petNum);
            DataTable dtSize = dsPetSize.Tables[0];
            DataRow drSize = dtSize.Rows[0];

            char size = Convert.ToChar(drSize["PET_FIXED"].ToString());
            return size;
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<Pet> getPetByOwner(int ownerNum)
        {
            PetDB petDB = new PetDB();
            DataSet pets = petDB.getPetsByOwnerDB(ownerNum);

            return getPets(pets.Tables[0], ownerNum);
        }

        public List<String> getPetsByReservation(int resNum)
        {
            PetDB petDB = new PetDB();

            List<String> pets = new List<String>();
            DataSet dsPets = petDB.getPetsByReservationDB(resNum);
            DataTable dtPets = dsPets.Tables[0];
            foreach(DataRow drPets in dtPets.Rows)
            {
                String petName = drPets["PET_NAME"].ToString();

                pets.Add(petName);
            }

            return pets;
        }

        public String getFixedString(int petNum)
        {
            char petFixed = getPetFixed(petNum);

            if (petFixed == 'Y')
            {
                return "Yes";
            }
            else if (petFixed == 'N')
            {
                return "No";
            }
            else
            {
                return "Unknown";
            }
        }

        public String getSizeString(int petNum)
        {
            char petSize = getPetSize(petNum);

            if (petSize == 'S')
            {
                return "Small";
            }
            else if (petSize == 'M')
            {
                return "Medium";
            }
            else if (petSize == 'L')
            {
                return "Large";
            }
            else
            {
                return "Unknown";
            }
        }

        public String getGenderString(int petNum)
        {
            char petGender = getPetGender(petNum);

            if (petGender == 'M')
            {
                return "Male";
            }
            else if (petGender == 'F')
            {
                return "Female";
            }
            else
            {
                return "Unknown";
            }
        }

    }
}
