using Microsoft.AspNetCore.Mvc;

namespace EvesLearning2025.Controllers
{
	public class AdminHomeController : Controller
	{
		public IActionResult Index()
		{
			ViewBag.Layout = "~/Views/Shared/_LayoutAdmin.cshtml";
			return View();
		}
	}
}
