using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Data
{
    public class CustomerOpinion_IOT

    {
        public int Id { get; set; }
        public int SmileyId { get; set; }
        public DateTime Timestamp { get; set; }
        public string CompanyName { get; set; }
        public string DevEUI { get; set; }
        public string ThingName { get; set; }

        public string Container { get; set; }

        public string LocationFriendlyName1 { get; set; }
        
    }
}
