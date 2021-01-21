using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DAL.Repository;
using DS = DAL.Services;
using DM = DAL.Data;
using SmileIT.API.Models;
using SmileIT.API.Utils;

namespace SmileIT.API.Services
{
    public class UserRepositoryAPI: IRepository<User, int>
    {
        IRepository<DM.User, int> _globalService;

        public UserRepositoryAPI()
        {
            _globalService = new DS.UserRepository();
        }

        public void Delete(int id)
        {
            _globalService.Delete(id);
        }

        public IEnumerable<User> Get()
        {
            return _globalService.Get().Select(u => u.ToLocal());
        }

        public User Get(int id)
        {
            return _globalService.Get(id)?.ToLocal();
        }

        public User Insert(User entity)
        {
            return _globalService.Insert(entity.ToGlobal()).ToLocal();
        }

        public User Update(int userId, User entity)
        {
            return _globalService.Update(userId, entity.ToGlobal()).ToLocal();
        }
    }
}
