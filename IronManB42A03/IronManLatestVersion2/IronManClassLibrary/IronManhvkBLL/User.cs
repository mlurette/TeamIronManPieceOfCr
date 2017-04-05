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
    public enum userType
    {
        Client,
        Clerk
    }

    public class User
    {
        public String type { get; set; }
        public userType user { get; set; }

        public User()
        {
            type = "";
        }

        public User(String _type)
        {
            type = _type;
        }

        
    }
}
