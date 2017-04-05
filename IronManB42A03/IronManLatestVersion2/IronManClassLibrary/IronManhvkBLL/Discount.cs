using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IronManhvkBLL
{
    public class Discount
    {
        public int discountNumber { get; set; }
        public String discountDescription { get; set; }
        public double discountPercentage { get; set; }
        public char discountType { get; set; }

        public Discount()
        {
            discountNumber = 0;
            discountDescription = "";
            discountPercentage = 0;
            discountType = ' ';
        }

        public Discount(int discNum, String description, double percentage, char type)
        {
            discountNumber = discNum;
            discountDescription = description;
            discountPercentage = percentage;
            discountType = type;
        }
    }
}
