using Microsoft.AspNetCore.Mvc;

namespace EvesLearning2025.Controllers
{
    public class QuestionController : Controller
    {
		private readonly IConfiguration _config;

		public QuestionController(IConfiguration config)
		{
			_config = config;
		}
		public IActionResult Index()
        {
			ViewBag.ApiBaseUrl = _config["ApiBaseUrl"];
			return View();
        }
        public IActionResult QuestionAdmin()
        {
			ViewBag.ApiBaseUrl = _config["ApiBaseUrl"];
			ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
            return View();
        }
        public IActionResult QuestionLevelAdmin()
        {
			ViewBag.ApiBaseUrl = _config["ApiBaseUrl"];
			ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
            return View();
        }
        public IActionResult QuestionTypeAdmin()
        {
			ViewBag.ApiBaseUrl = _config["ApiBaseUrl"];
			ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
            return View();
        }
		public IActionResult QuestionGroupAdmin()
		{
			ViewBag.ApiBaseUrl = _config["ApiBaseUrl"];
			ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
			return View();
		}
		public IActionResult QuestionGrammarAdmin()
		{
			ViewBag.ApiBaseUrl = _config["ApiBaseUrl"];
			ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
			return View();
		}
        public IActionResult QuestionCategoriesAdmin()
        {
			ViewBag.ApiBaseUrl = _config["ApiBaseUrl"];
			ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
            return View();
        }
    }
}
