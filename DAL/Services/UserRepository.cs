using DAL.Data;
using DAL.Mappers;
using DAL.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ToolBox;

namespace DAL.Services
{
    public class UserRepository : IRepository<User, int>
    {
        private const string ConnectionString =
               @"Data Source=ADILMU\SQLEXPRESS03;Initial Catalog=Smile_IT_IOT;Integrated Security=True"; //lk connection string
               //@"Data Source=DELL-M4500\SQLEXPRESS;Initial Catalog=SmileIT.DB;Integrated Security=True"; // jy Connection string
        private Connection _dbConnection;

        public UserRepository()
        {
            _dbConnection = new Connection(ConnectionString);
        }

        public void Delete(int id)
        {
            Command command = new Command("SP_User_Delete", true);
            command.AddParameter("pUserId", id);

            _dbConnection.ExecuteNonQuery(command);
        }

        public IEnumerable<User> Get()
        {
            Command command = new Command("SP_User_ReadAll");
            return _dbConnection.ExecuteReader(command, (dr) => dr.ToUser());
        }

        public User Get(int id)
        {
            Command command = new Command("SP_User_ReadOne", true);
            command.AddParameter("pUserId", id);
            return _dbConnection.ExecuteReader(command, (dr) => dr.ToUser()).SingleOrDefault();
        }

        public User Insert(User entity)
        {
            Command command = new Command("SP_User_Insert", true);
            command.AddParameter("pEmail", entity.Email);
            command.AddParameter("pUsername", entity.Username);
            command.AddParameter("pPassword", entity.Password);
            command.AddParameter("pFK_Role", entity.Role);
            //_dbConnection.ExecuteNonQuery(command);

            entity.Id = (int)_dbConnection.ExecuteScalar<User>(command);
            return entity;
        }

        public User Update(int Id, User entity)
        {
            Command command = new Command("SP_User_Update", true);
            command.AddParameter("pUserId", Id);
            command.AddParameter("pEmail", entity.Email);
            command.AddParameter("pUsername", entity.Username);
            command.AddParameter("pPassword", entity.Password);
            command.AddParameter("pRole", entity.Role);

            if (_dbConnection.ExecuteNonQuery(command) > 0)
            {
                return this.Get(Id);
            }
            return entity;
        }
    }    
}
