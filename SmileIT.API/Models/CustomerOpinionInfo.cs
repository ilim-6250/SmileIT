using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SmileIT.API.Models
{
    public class CustomerOpinionInfo
    {

        [Required]
        public int SmileyId { get; set; }
        public string Commentary { get; set; }
        [Required]
        [DataType ("DateTime2")]
        public DateTime Created_at { get; set; }
    }
}
