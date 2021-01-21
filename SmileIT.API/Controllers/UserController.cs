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

namespace SmileIT.API.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private IRepository<L.User, int> _service;

        public UserController()
        {
            _service = new UserRepositoryAPI();
        }

        [HttpGet]
        public IEnumerable<L.User> Get()
        {
            return _service.Get();
        }

        [HttpGet("{id}")]
        public L.User Get(int id)
        {
            return _service.Get(id);
        }

        [HttpPost]
        public L.User AddUser(UserInfo userInfo)
        {
            return _service.Insert(new L.User(userInfo.Email,userInfo.Username, userInfo.Password, userInfo.Role));
        }

        [HttpPut("{id}")]
        public L.User UpdateUser(int id, UserInfo userInfo)
        {
            return _service.Update(id, new L.User(userInfo.Email,userInfo.Username, userInfo.Password, userInfo.Role));
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            _service.Delete(id);
        }

    }
}
