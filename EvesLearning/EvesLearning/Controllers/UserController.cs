using BusinessObject.Models;
using EvesLearning.IRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EvesLearning.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepository;

        public UserController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [HttpPost]
        public async Task<IActionResult> AddUser([FromBody] Mcuser user)
        {
            if (user == null) return BadRequest("User is null");

            try
            {
                await _userRepository.AddUserAsync(user);
                return Ok(new { Message = "User added successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }
    }
}
