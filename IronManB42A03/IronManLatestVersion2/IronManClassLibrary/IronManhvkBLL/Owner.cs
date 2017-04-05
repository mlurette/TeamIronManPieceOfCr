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
    public class Owner
    {
        public int ownerNumber { get; set; }
        public String ownerFirstName { get; set; }
        public String ownerLastName { get; set; }
        public String ownerStreet { get; set; }
        public String ownerCity { get; set; }
        public String ownerProvince { get; set; }
        public String ownerPostalCode { get; set; }
        public String ownerPhone { get; set; }
        public String ownerEmail { get; set; }
        public String emergFirstName { get; set; }
        public String emergLastName { get; set; }
        public String emergPhone { get; set; }
        public List<Pet> ownerPet { get; set; }

        public Owner()
        {
            ownerPet = new List<Pet>();
            ownerNumber = 0;
            ownerFirstName = "";
            ownerLastName = "";
            ownerStreet = "";
            ownerCity = "";
            ownerProvince = "";
            ownerPostalCode = "";
            ownerPhone = "";
            ownerEmail = "";
            emergFirstName = "";
            emergLastName = "";
            emergPhone = "";

        }

        public Owner(int custNum, String first, String last)
        {
            ownerPet = new List<Pet>();
            ownerNumber = custNum;
            ownerFirstName = first;
            ownerLastName = last;
            ownerStreet = "";
            ownerCity = "";
            ownerProvince = "";
            ownerPostalCode = "";
            ownerPhone = "";
            ownerEmail = "";
            emergFirstName = "";
            emergLastName = "";
            emergPhone = "";
        }

        public Owner(int custNum, String first, String last,
            String street, String city, String prov, String postal, String phone,
            String email, String emergFirst, String emergLast, String emPhone)
        {
            ownerPet = new List<Pet>();
            ownerNumber = custNum;
            ownerFirstName = first;
            ownerLastName = last;
            ownerStreet = street;
            ownerCity = city;
            ownerProvince = prov;
            ownerPostalCode = postal;
            ownerPhone = phone;
            ownerEmail = email;
            emergFirstName = emergFirst;
            emergLastName = emergLast;
            emergPhone = emergPhone;
        }

        public void addPet(Pet newPet)
        {
            ownerPet.Add(newPet);
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<Owner> listOwners()
        {
            OwnerDB ownDB = new OwnerDB();
            DataSet owners = ownDB.listOwnersDB();
            return getOwners(owners.Tables[0]);
        }

       
        public List<Owner> getOwners(DataTable ownerTable)
        {
            List<Owner> owners = new List<Owner>();
            
            foreach(DataRow row in ownerTable.Rows)
            {
                Owner owner = new Owner();
                owner.ownerNumber = Convert.ToInt32(row["OWNER_NUMBER"].ToString());
                owner.ownerFirstName = row["OWNER_FIRST_NAME"].ToString();
                owner.ownerLastName = row["OWNER_LAST_NAME"].ToString();
                owner.ownerStreet = row["OWNER_STREET"].ToString();
                owner.ownerCity = row["OWNER_CITY"].ToString();
                owner.ownerProvince = row["OWNER_PROVINCE"].ToString();
                owner.ownerPostalCode = row["OWNER_POSTAL_CODE"].ToString();
                owner.ownerPhone = row["OWNER_PHONE"].ToString();
                owner.ownerEmail = row["OWNER_EMAIL"].ToString();
                owner.emergFirstName = row["EMERGENCY_CONTACT_FIRST_NAME"].ToString();
                owner.emergLastName = row["EMERGENCY_CONTACT_LAST_NAME"].ToString();
                owner.emergPhone = row["EMERGENCY_CONTACT_PHONE"].ToString();
                owners.Add(owner);
            }
            
            return owners;
        }

        private Owner getOwnerInfo(DataTable dtOwner)
        {
            Owner owner = new Owner();
            if (dtOwner != null)
            {
                for (int i = 0; i < dtOwner.Rows.Count; i++)
                {
                    try
                    {
                        owner.ownerNumber = Convert.ToInt32(dtOwner.Rows[i]["OWNER_NUMBER"].ToString());
                        owner.ownerFirstName = dtOwner.Rows[i]["OWNER_FIRST_NAME"].ToString();
                        owner.ownerLastName = dtOwner.Rows[i]["OWNER_LAST_NAME"].ToString();
                        owner.ownerStreet = dtOwner.Rows[i]["OWNER_STREET"].ToString();
                        owner.ownerCity = dtOwner.Rows[i]["OWNER_CITY"].ToString();
                        owner.ownerProvince = dtOwner.Rows[i]["OWNER_PROVINCE"].ToString();
                        owner.ownerPostalCode = dtOwner.Rows[i]["OWNER_POSTAL_CODE"].ToString();
                        owner.ownerPhone = dtOwner.Rows[i]["OWNER_PHONE"].ToString();
                        owner.ownerEmail = dtOwner.Rows[i]["OWNER_EMAIL"].ToString();
                        owner.emergFirstName = dtOwner.Rows[i]["EMERGENCY_CONTACT_FIRST_NAME"].ToString();
                        owner.emergLastName = dtOwner.Rows[i]["EMERGENCY_CONTACT_LAST_NAME"].ToString();
                        owner.emergPhone = dtOwner.Rows[i]["EMERGENCY_CONTACT_PHONE"].ToString();
                    }
                    catch
                    {
                        Console.Write("Stuff");
                    }
                }

            }
            else
            {
                owner = null;
            }
            return owner;
        }

        public Owner getOwner(String email)
        {
            UserDB loginObj = new UserDB();
            DataSet loginDS = loginObj.getOwnerByEmailDB(email);

            return getOwnerInfo(loginDS.Tables[0]);
        }

        

        public void updateOwner(int ownerNumber, String ownerFirstName, String ownerLastName, String ownerStreet,
                String ownerCity, String ownerProvince, String ownerPostalCode, String ownerPhone, String ownerEmail, String emergFirstName,
                String emergLastName, String emergPhone)
        {
            OwnerDB ownDB = new OwnerDB();
            ownDB.updateOwnerDB(ownerNumber, ownerFirstName, ownerLastName, ownerStreet,
                ownerCity, ownerProvince, ownerPostalCode, ownerPhone, ownerEmail, emergFirstName, 
                emergLastName, emergPhone);
        }
    }
}
