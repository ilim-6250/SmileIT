using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Data
{
    public class CustomerOpinion_IOT

    {
        public int Id { get; set; }
        public int SmileyId { get; set; }
        public string Localisation { get; set; }
        public DateTime Created_at { get; set; }
        public string CompanyName { get; set; }
    }
}
