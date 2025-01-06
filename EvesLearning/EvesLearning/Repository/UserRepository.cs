using BusinessObject.Models;
using EvesLearning.IRepository;
using Microsoft.EntityFrameworkCore;

namespace EvesLearning.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly eLearningContext _context;

        public UserRepository(eLearningContext context)
        {
            _context = context;
        }
        public async Task AddUserAsync(Mcuser user)
        {
            if (user == null) throw new ArgumentNullException(nameof(user));
            await _context.Set<Mcuser>().AddAsync(user);
            await _context.SaveChangesAsync();
        }
    }
}
