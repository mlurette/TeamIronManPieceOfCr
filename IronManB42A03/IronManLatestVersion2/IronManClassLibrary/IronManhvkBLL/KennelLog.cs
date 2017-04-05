using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IronManhvkBLL
{
    public class KennelLog
    {
        public DateTime kennelLogDate { get; set; }
        public int kennelLogSequenceNumber { get; set; }
        public String kennelLogNotes { get; set; }
        public PetReservation petReservation { get; set; }

        public KennelLog()
        {
            kennelLogDate = DateTime.Now;
            kennelLogSequenceNumber = 0;
            kennelLogNotes = "";
            petReservation = null;
        }

        public KennelLog(DateTime date, int sequenceNum, String notes, PetReservation petRes)
        {
            kennelLogDate = date;
            kennelLogSequenceNumber = sequenceNum;
            kennelLogNotes = notes;
            petReservation = petRes;
        }
    }
}
