using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IronManhvkDB;

namespace IronManhvkBLL
{
    public class PetRun
    {
        public int runNumber { get; set; }
        public char runSize { get; set; }
        public bool runCovered { get; set; }
        public char runLocation { get; set; }
        public int runStatus { get; set; }

        public PetRun()
        {
            this.runNumber = 0;
            this.runSize = '0';
        }
        public PetRun(int num, char size)
        {
            this.runNumber = num;
            this.runSize = size;
            this.runCovered = true;
            this.runLocation = ' ';
            this.runStatus = 0;
        }
        public PetRun(int num, char size, bool covered, char location, int status)
        {
            this.runNumber = num;
            this.runSize = size;
            this.runCovered = covered;
            this.runLocation = location;
            this.runStatus = status;
        }

        public Codes checkRunAvailability(DateTime start, DateTime end, char size)
        {
            Codes code = Codes.success;
            PetRunDB petRun = new PetRunDB();
            int availableRuns;

            Reservation res = new Reservation();

            code = res.checkDatesValid(start, end);

           if(code == Codes.success)
            {
                if (size == 'L')
                {
                    for (DateTime dateTime = start;
                         dateTime < end;
                         dateTime += TimeSpan.FromDays(1))
                    {
                        availableRuns = petRun.largeRunAvailableDB(dateTime);
                        if (availableRuns < 1)
                            code = Codes.noRunAvailable;
                    }

                }
                else
                {
                    for (DateTime dateTime = start;
                        dateTime <= end;
                        dateTime += TimeSpan.FromDays(1))
                    {
                        availableRuns = petRun.allRunAvailableDB(dateTime);
                        if (availableRuns < 1)
                            code = Codes.noRunAvailable;
                    }
                }

            }
            return code;
        }//availableRuns() takes a start and end date of a pet's given reservation. It checks every day of the reservation for available runs and returns the number of runs available for the totality of the stay.

    }
}
