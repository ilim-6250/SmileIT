using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Data
{
    public class CustomerOpinion
    {
        public int Id { get; set; }
        public int SmileyId { get; set; }
        public string Commentary { get; set; }
        public DateTime Created_at { get; set; }
    }
}
