using Microsoft.AspNetCore.Mvc;

namespace EvesLearning2025.Controllers
{
    public class QuestionLevelController : Controller
    {
        public IActionResult Index()
        {
            ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
            return View();
        }
    }
}
