using BusinessObject.Models;

namespace EvesLearning.IRepository
{
    public interface IUserRepository
    {
       Task AddUserAsync(Mcuser user);
    }
}
