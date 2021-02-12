using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SmileIT.API.Models
{
    public class CustomerOpinion_IOT_info
    {
       // [Required]
       // public int SmileyId { get; set; }
        [Required]
        [DataType("DateTime2")]
        public DateTime Timestamp { get; set; }
        public string CompanyName { get; set; }
        public string DevEUI { get; set; }
        public string ThingName { get; set; }
        public string Container { get; set; }
        public string LocationFriendlyName1 { get; set; }
        public string Value { get; set; }

    }
}


