using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ToolBox;
using DAL.Repository;
using L = SmileIT.API.Models;
using S = DAL.Services;
using SmileIT.API.Services;
using System.Net.Http;
using SmileIT.API.Models;
using System.Net;
using System.Data.SqlClient;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authorization;
using DS = DAL.Services;

namespace SmileIT.API.Controllers
{
    // [Authorize] 
    [ApiController]
    [Route("api/[controller]")]
    public class CustomerOpinionController : ControllerBase
    {
        private IRepository<L.CustomerOpinion, int> _service;

        private CustomerOpinionRepositoryAPI _iotService; //iot service qui fait appel au service de la DAL
        public CustomerOpinionController()
        {
            _service = new CustomerOpinionRepositoryAPI();
            _iotService = new CustomerOpinionRepositoryAPI();
        }

        [HttpGet]
        public IEnumerable<L.CustomerOpinion> Get()
        {
            return _service.Get();
        }
        [HttpGet("{dateStart},{dateEnd}")]
        public IEnumerable<DAL.Data.CustomerOpinionAverageBetweenTwoDate> Getavg(string dateStart, string dateEnd)
        {
            return new S.CustomerOpinionRepository().GetAvg(dateStart, dateEnd);
        }
        [HttpGet("listBetweenTwoDate/{dateStart},{dateEnd}")]
        public IEnumerable<DAL.Data.CustomerOpinionReadListBetweenTwoDate> GetListBetweenTwoDate(string dateStart, string dateEnd)
        {
            return new S.CustomerOpinionRepository().GetListBetweenTwoDates(dateStart, dateEnd);
        }

        [HttpGet("{id}")]
        public L.CustomerOpinion Get(int id)
        {
            return _service.Get(id);
        }

        [HttpPost, AllowAnonymous]
        //[AcceptVerbs("POST")]
        //[Route("AddUser")] 
        public L.CustomerOpinion AddCustomerOpinion(CustomerOpinionInfo entityInfo)
        {
            return _service.Insert(new L.CustomerOpinion(entityInfo.SmileyId, entityInfo.Commentary, entityInfo.Created_at));
        }

        [HttpPost("IOT"), AllowAnonymous]
        //[AcceptVerbs("POST")]
        //[Route("AddUser")] 
        public L.CustomerOpinion_IOT AddCustomerOpinion_IOT (CustomerOpinion_IOT_info entityInfo)
        {
            
            int ConvertIotValueToAPISmileyID(string Value)

            {
                int Smiley = 0;
                string ID = Value.Substring(4, 2);  // A16231F5,A16233F5,A16235F5
                switch (ID)
                {
                    case "31":
                        Smiley = 1;
                        break;
                    case "33":
                        Smiley= 3;
                        break;
                    case "35":
                        Smiley = 5;
                        break;
                    default:
                        Smiley = 3;
                        break;
                }
                return Smiley;
            }
          
        int SmileyId = 0;
        SmileyId = ConvertIotValueToAPISmileyID (entityInfo.Value); // je me sers de la fonction 
        return _iotService.Insert_IOT(new L.CustomerOpinion_IOT(SmileyId, entityInfo.Timestamp, entityInfo.CompanyName, entityInfo.DevEUI, entityInfo.ThingName, entityInfo.Container, entityInfo.LocationFriendlyName1));//L pour local
        }
        [HttpPut("{id}")]
        //[AcceptVerbs("PUT")]
        //[Route("UpdateUser/{id}")]
        public L.CustomerOpinion UpdateCustomerOpinion(int id, CustomerOpinionInfo entityInfo)
        {
            return _service.Update(id, new L.CustomerOpinion(entityInfo.SmileyId, entityInfo.Commentary, entityInfo.Created_at));
        }

        [HttpDelete("{id}")]
        //[AcceptVerbs("DELETE")]
        //[Route("DeleteUser/{id}")]
        public void Delete(int id)
        {
            _service.Delete(id);
        }

    }
}
