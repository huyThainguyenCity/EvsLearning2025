using Microsoft.AspNetCore.Mvc;

namespace EvesLearning2025.Controllers
{
    public class AccountController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
