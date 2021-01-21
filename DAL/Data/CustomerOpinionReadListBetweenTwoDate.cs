using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Data
{
    public class CustomerOpinionReadListBetweenTwoDate
    {
        public DateTime CustomerReviewDateTime { get; set; }
        public int idSmiley { get; set; }
        public string CustomerComment { get; set; }
        public string Username { get; set; }

    }
}
