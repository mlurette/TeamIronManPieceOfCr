using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IronManhvkBLL
{
    public class Medication
    {
        public int medicationNumber { get; set; }
        public String medicationName { get; set; }
        public String medicationDosage { get; set; }
        public String medicationInstruction { get; set; }
        public DateTime medicationEndDate { get; set; }
        public Pet petMedication { get; set; }

        public Medication()
        {
            medicationNumber = 0;
            medicationName = "";
            medicationDosage = "";
            medicationInstruction = "";
            medicationEndDate = DateTime.Now;
            petMedication = new Pet();
        }

        public Medication(int medNumber, String medName, Pet pet)
        {
            medicationNumber = medNumber;
            medicationName = medName;
            medicationDosage = "";
            medicationInstruction = "";
            medicationEndDate = DateTime.Now;
            petMedication = pet;
        }

        public Medication(int medNumber, String medName, Pet pet, String dosage, String instructions, DateTime date)
        {
            medicationNumber = medNumber;
            medicationName = medName;
            medicationDosage = dosage;
            medicationInstruction = instructions;
            medicationEndDate = date;
            petMedication = pet;
        }
    }
}
