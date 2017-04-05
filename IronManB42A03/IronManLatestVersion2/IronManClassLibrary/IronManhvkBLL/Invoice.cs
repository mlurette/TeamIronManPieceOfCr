using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IronManhvkBLL
{
    public class Invoice
    {
        public Reservation reservation { get; set; }

        public Invoice()
        {
            this.reservation = null;
        }
        public Invoice(Reservation res)
        {
            this.reservation = res;
        }

        public decimal CalculateTotal()
        {
            return 0;
            //need invoice template to complete this method
        }
    }
}
