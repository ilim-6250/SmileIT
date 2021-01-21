using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SmileIT.API.Models
{
    public class CustomerOpinion_IOT_info
    {
        [Required]
        public int SmileyId { get; set; }
        public string Localisation { get; set; }
        [Required]
        [DataType("DateTime2")]
        public DateTime Created_at { get; set; }
    }
}


