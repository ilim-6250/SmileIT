using DAL.Data;
using DAL.Mappers;
using DAL.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using ToolBox;

namespace DAL.Services 
{
    public class CustomerOpinionRepository: IRepository<CustomerOpinion, int> 
    {
        private const string ConnectionString =
              @"Data Source=smileitsql;Database=master;User=sa;Password=B20c2271;"; 
        //lk connection string
        //@"Data Source=DELL-M4500\SQLEXPRESS;Initial Catalog=SmileIT.DB;Integrated Security=True"; // jy Connection string
        private Connection _dbConnection;

        public CustomerOpinionRepository()
        {
            _dbConnection = new Connection(ConnectionString);
        }

        public void Delete(int id)
        {
            Command command = new Command("SP_CustomerOpinion_DeleteById", true);
            command.AddParameter("Id", id);

            _dbConnection.ExecuteNonQuery(command);
        }

        public IEnumerable<CustomerOpinion> Get()
        {
            Command command = new Command("SELECT * FROM CustomersOpinions");
            return _dbConnection.ExecuteReader(command, (dr) => dr.ToCustomerOpinion());
        }

        public CustomerOpinion Get(int id)
        {
            Command command = new Command("SELECT * FROM CustomersOpinions WHERE id_CustomerOpinion = "+id+";");
            command.AddParameter("CustomerOpinionId", id);
            return _dbConnection.ExecuteReader(command, (dr) => dr.ToCustomerOpinion()).SingleOrDefault();
        }

        public CustomerOpinion Insert(CustomerOpinion entity)
        {
            Command command = new Command("SP_CustomerOpinion_Insert", true);
            command.AddParameter("idSmiley", entity.SmileyId);
            command.AddParameter("Comment", entity.Commentary);
            command.AddParameter("pCreated_at", entity.Created_at);
            //command.AddParameter("userId", 2);
      
            entity.Id = (int)_dbConnection.ExecuteScalar<CustomerOpinion>(command);

            return entity;
        }

        public CustomerOpinion_IOT Insert_IOT (CustomerOpinion_IOT entity)
        {
            Command command = new Command("SP_CustomerOpinion_insert_IOT", true);
            command.AddParameter("idSmiley", entity.SmileyId);
            command.AddParameter("pTimestamp", entity.Timestamp);
            command.AddParameter("pCompanyName", entity.CompanyName);
            command.AddParameter("pDevEUI", entity.DevEUI);
            command.AddParameter("pThingName", entity.ThingName);
            command.AddParameter("pContainer", entity.Container);
            command.AddParameter("pLocationFriendlyName1", entity.LocationFriendlyName1);
                       //command.AddParameter("userId", 2);

            entity.Id = (int)_dbConnection.ExecuteScalar<CustomerOpinion_IOT>(command);

            return entity;
        }

        public CustomerOpinion Update(int IdCustomerOp, CustomerOpinion entity)
        {
            Command command = new Command("SP_CustomerOpinion_Update", true);
            command.AddParameter("pCustomerComment", entity.Commentary);
            command.AddParameter("pId", IdCustomerOp);
            command.AddParameter("pFK_Smiley", entity.SmileyId);
            command.AddParameter("pCreated_at", entity.Created_at);
            //command.AddParameter("pFK_User", 2);

            if (_dbConnection.ExecuteNonQuery(command) > 0)
            {
                return this.Get(IdCustomerOp);
            }
            return entity;
        }
        //public IEnumerable<string> GetAvg(string dateStart, string dateEnd)
        //{
        //    Command command = new Command("SP_CustomerOpinion_ReadAverageBetweenTwoDate", true);
        //    command.AddParameter("DateStartString", dateStart);
        //    command.AddParameter("DateEndString", dateEnd);
        //    return _dbConnection.ExecuteReader(command, (dr) => dr.ToString());
        //}
        public IEnumerable<CustomerOpinionAverageBetweenTwoDate> GetAvg(string dateStart, string dateEnd)
        {
            Command command = new Command("SP_CustomerOpinion_ReadAverageBetweenTwoDate", true);
            command.AddParameter("DateStartString", dateStart);
            command.AddParameter("DateEndString", dateEnd);
            return _dbConnection.ExecuteReader(command, (dr) => dr.ToCustomerOpinionAverageBewteenTwoDate());
        }
        public IEnumerable<CustomerOpinionReadListBetweenTwoDate> GetListBetweenTwoDates(string dateStart,string dateEnd)
        {
            Command cmd = new Command("SP_CustomerOpinion_ReadListBetweenTwoDate", true);
            cmd.AddParameter("DateStartString", dateStart);
            cmd.AddParameter("DateEndString", dateEnd);
            return _dbConnection.ExecuteReader(cmd, (dr) => dr.ToCustomerOpinionReadListBetweenTwoDate());
        }
    }
}

