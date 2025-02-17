using Microsoft.AspNetCore.Mvc;

namespace EvesLearning2025.Controllers
{
	public class ExamController : Controller
	{
		private readonly IConfiguration _config;

		public ExamController(IConfiguration config)
		{
			_config = config;
		}
		public IActionResult Index()
		{
			return View();
		}
        public IActionResult ExamAdmin()
        {
            ViewBag.ApiBaseUrl = _config["ApiBaseUrl"];
            ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
            return View();
        }
    }
}
