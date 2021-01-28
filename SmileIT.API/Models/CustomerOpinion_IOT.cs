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
        public DateTime Timestamp { get; set; }
        public string CompanyName { get; set; }
        public string DevEUI { get; set; }
        public string ThingName { get; set; }
        public string Container { get; set; }
        public string LocationFriendlyName1 { get; set; }
        //public string Value { get; set; }
        public CustomerOpinion_IOT() //constructeur par défault
        {

        }
        public CustomerOpinion_IOT (int smileyId, DateTime timestamp,string companyName, string devEUI, string thingName, string container, string locationFriendlyName1)
        {
            SmileyId = smileyId;
            Timestamp = timestamp;
            CompanyName = companyName;
            DevEUI = devEUI;
            ThingName = thingName;
            Container = container;
            LocationFriendlyName1 = locationFriendlyName1;
            // Value = value; 

        }

        internal CustomerOpinion_IOT (int id, int smileyId, DateTime timestamp, string companyName, string devEUI, string thingName, string container, string locationFriendlyName1)
            : this( smileyId, timestamp,companyName,  devEUI,  thingName,  container,  locationFriendlyName1)
        {
            Id = id;
        }


    }
}

