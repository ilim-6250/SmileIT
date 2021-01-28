using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using DAL.Data;
using System.Runtime.InteropServices.WindowsRuntime;

namespace DAL.Mappers
{
    internal static class DataRecordExtensions
    {
        internal static User ToUser(this IDataRecord dR)
        {
            return new User()
            {
                Id = (int)dR["id_User"],
                Email = dR["Email"].ToString(),
                Username = dR["Username"].ToString(),
                Password = "******", //Attention, mot de passe encrypté, pas possible de le récupérer
                Role = (int)dR["FK_Role"]
            };
        }

        internal static CustomerOpinion ToCustomerOpinion(this IDataRecord dR)
        {
            return new CustomerOpinion()
            {
                Id = (int)dR["id_CustomerOpinion"],
                SmileyId = (int)dR["FK_Smiley"],
                Commentary = (dR["CustomerComment"] != DBNull.Value) ? dR["CustomerComment"].ToString() : null,
                Created_at = (DateTime)dR["CustomerReviewDateTime"]
                //SagaName = (dR["SagaName"] != DBNull.Value) ? dR["SagaName"].ToString() : null,
                //LastEdit = (dR["LastEdit"] != DBNull.Value) ? (DateTime?)dR["LastEdit"] : null
            };
        }

        internal static CustomerOpinion_IOT ToCustomerOpinion_IOT (this IDataRecord dR)
        {
            return new CustomerOpinion_IOT()
            {
                Id = (int)dR["id_CustomerOpinion"],
                SmileyId = (int)dR["FK_Smiley"],
                Timestamp = (DateTime)dR["CustomerReviewDateTime"],
                CompanyName = (dR["CompanyName"] != DBNull.Value) ? dR["CompanyName"].ToString() : null,
                DevEUI = (dR["DevEUI"] != DBNull.Value) ? dR["DevEUI"].ToString() : null,
                ThingName = (dR["ThingName"] != DBNull.Value) ? dR["ThingName"].ToString() : null,
                Container = (dR["Container"] != DBNull.Value) ? dR["Container"].ToString() : null,
                LocationFriendlyName1 = (dR["LocationFriendlyName1"] != DBNull.Value) ? dR["LocationFriendlyName1"].ToString() : null,
               
                //SagaName = (dR["SagaName"] != DBNull.Value) ? dR["SagaName"].ToString() : null,
                //LastEdit = (dR["LastEdit"] != DBNull.Value) ? (DateTime?)dR["LastEdit"] : null
            };
        }

        internal static CustomerOpinionAverageBetweenTwoDate ToCustomerOpinionAverageBewteenTwoDate(this IDataRecord dr)
        {
            return new CustomerOpinionAverageBetweenTwoDate() { 
                SmileyId = (int)dr[0],
                NumberOfVote = (int)dr[1],
                Percent = (double)dr[2]
            };
        }
        internal static CustomerOpinionReadListBetweenTwoDate ToCustomerOpinionReadListBetweenTwoDate(this IDataRecord dr)
        {
            return new CustomerOpinionReadListBetweenTwoDate()
            {
                CustomerReviewDateTime = (DateTime)dr[0],
                idSmiley = (int)dr[1],
                CustomerComment = (string)dr[2],
                Username = (string)dr[3]
            };
        }
    }
}
