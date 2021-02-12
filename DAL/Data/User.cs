using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Data
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public int Role { get; set; }
        public string Password { get; set; }
    }
}
