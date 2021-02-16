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
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using SmileIT.API.Utils;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Authorization;

namespace SmileIT.API.Controllers
{
   [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {        
        private const string ConnectionString =
              @"Data Source=smileitsql;Database=master;User=sa;Password=B20c2271;"; 
        //lk connection string
        //@"Data Source=DELL-M4500\SQLEXPRESS;Initial Catalog=SmileIT.DB;Integrated Security=True" // jy Connection string
        private Connection _connection;
        private AppSettings _appSettings;
        private IRepository<L.User, int> _service;

        public AuthController(IOptions<AppSettings> appSettings)
        {
            _service = new UserRepositoryAPI();
           _connection = new Connection(ConnectionString);
            _appSettings = appSettings.Value;
        }
              

        [HttpPost, AllowAnonymous]
        [Route("Login")]
        public IActionResult Login(LoginInfo entity)
        {
            try
            {
                if (!(entity is null) && ModelState.IsValid)
                {
                    Command command = new Command("SP_User_Login", true);
                    command.AddParameter("pUsername", entity.Username);
                    command.AddParameter("pPassword", entity.Password);

                    DAL.Data.User user = _connection.ExecuteReader(command, (dr) => new DAL.Data.User()
                    {
                        Id = (int)dr["id_User"],
                        Username = dr[nameof(user.Username)].ToString(),
                        Email = dr["Email"].ToString(),
                        Role = (int)dr["FK_Role"]
                    }).SingleOrDefault();

                    if (user is null)
                        return Unauthorized();
                    else
                    {

                        var tokenHandler = new JwtSecurityTokenHandler();
                        var key = Encoding.ASCII.GetBytes(_appSettings.SecretJWT);
                        var tokenDescriptor = new SecurityTokenDescriptor
                        {
                            Subject = new ClaimsIdentity(new Claim[]
                            {
                                new Claim(ClaimTypes.Name, user.Id.ToString())
                            }),
                            Expires = DateTime.UtcNow.AddDays(7),
                            SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256)
                        };
                        var token = tokenHandler.CreateToken(tokenDescriptor);
                        var tokenString = tokenHandler.WriteToken(token);                        
                        return Ok(new { Token = tokenString });
                        // TODO: return the user instead, with the code below:
                        //return Ok(new {
                        //        Id = user.Id,
                        //        Username = user.Username,
                        //        Email = user.Email,
                        //        Role = user.Role,
                        //        Password = "*******",
                        //        Token = tokenString
                        //        });

                    }
                }
            }
            catch (SqlException exception)
            {
                return Unauthorized();
            }

            return Unauthorized();
        }
    }
}
