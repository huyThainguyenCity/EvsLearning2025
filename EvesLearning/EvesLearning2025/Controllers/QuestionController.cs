using Microsoft.AspNetCore.Mvc;

namespace EvesLearning2025.Controllers
{
    public class QuestionController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult QuestionAdmin()
        {
            ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
            return View();
        }
        public IActionResult QuestionLevelAdmin()
        {
            ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
            return View();
        }
    }
}
