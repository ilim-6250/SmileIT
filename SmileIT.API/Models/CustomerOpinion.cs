using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmileIT.API.Models
{
    public class CustomerOpinion
    {
        public int Id { get; set; }
        public int SmileyId { get; set; }
        public string Commentary { get; set; }
        public DateTime Created_at { get; set; }

        public CustomerOpinion()
        {

        }

        public CustomerOpinion(int smileyId, string commentary, DateTime created_at)
        {
            SmileyId = smileyId;
            Commentary = commentary;
            Created_at = created_at;
        }

        internal CustomerOpinion(int id, int smileyId, string commentary, DateTime created_at)
            :this(smileyId, commentary,created_at)
        {
            Id = id;
        }


    }
}
