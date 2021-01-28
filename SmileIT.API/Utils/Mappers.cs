using SmileIT.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using D = DAL.Data;

namespace SmileIT.API.Utils
{
    public static class Mappers
    {
        public static User ToLocal(this D.User entity)
        {
            return new User()
            {
                Id = entity.Id,
                Email = entity.Email,
                Username = entity.Username,
                Password = entity.Password,
                Role = entity.Role
            };
        }

        public static D.User ToGlobal(this User entity)
        {
            return new D.User()
            {
                Id = entity.Id,
                Email = entity.Email,
                Username = entity.Username,
                Password = entity.Password,
                Role = entity.Role
            };
        }

        public static CustomerOpinion ToLocal(this D.CustomerOpinion entity)
        {
            return new CustomerOpinion()
            {
                Id = entity.Id,
                SmileyId = entity.SmileyId,
                Commentary = entity.Commentary,
                Created_at = entity.Created_at
            };
        }
        public static CustomerOpinion_IOT ToLocal(this D.CustomerOpinion_IOT entity)   //DAL VERS API
        {
            return new CustomerOpinion_IOT()
            {
                Id = entity.Id,
                SmileyId = entity.SmileyId,
                Timestamp = entity.Timestamp,
                CompanyName = entity.CompanyName,
                DevEUI = entity.DevEUI,
                ThingName = entity.ThingName,
                Container = entity.Container,
                LocationFriendlyName1 = entity.LocationFriendlyName1
            };
        }

        public static D.CustomerOpinion ToGlobal(this CustomerOpinion entity)  //API VERS LA DAL
        {
            return new D.CustomerOpinion()
            {
                Id = entity.Id,
                SmileyId = entity.SmileyId,
                Commentary = entity.Commentary,
                Created_at = entity.Created_at
            };
        }

        public static D.CustomerOpinion_IOT ToGlobal(this CustomerOpinion_IOT entity)
        {
            return new D.CustomerOpinion_IOT()
            {
                Id = entity.Id,
                SmileyId = entity.SmileyId,
                Timestamp = entity.Timestamp,
                CompanyName = entity.CompanyName,
                DevEUI = entity.DevEUI,
                ThingName = entity.ThingName,
                Container = entity.Container,
                LocationFriendlyName1 = entity.LocationFriendlyName1
            };
        }
    }
}

