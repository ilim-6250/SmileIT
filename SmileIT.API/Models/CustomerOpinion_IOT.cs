using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmileIT.API.Models
{
    public class CustomerOpinion_IOT
    {
        public int Id { get; set; }
        public int SmileyId { get; set; }
        public string Localisation { get; set; }
        public string CompanyName { get; set; }
        public DateTime Created_at { get; set; }
        
        public CustomerOpinion_IOT() //constructeur par défault
        {

        }
        public CustomerOpinion_IOT (int smileyId, string localisation, string companyName, DateTime created_at)
        {
            SmileyId = smileyId;
            Localisation = localisation; //nom de variable 
            CompanyName = companyName; 
            Created_at = created_at;
        }

        internal CustomerOpinion_IOT (int id, int smileyId, string localisation, string companyName, DateTime created_at)
            : this(smileyId, localisation, companyName, created_at)
        {
            Id = id;
        }


    }
}

