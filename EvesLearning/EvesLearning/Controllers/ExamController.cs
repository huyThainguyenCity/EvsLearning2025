using EvesLearning.DTOs;
using EvesLearning.IRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EvesLearning.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExamController : ControllerBase
    {
		private readonly IExamRepository _examRepositoy;

		public ExamController(IExamRepository examRepositoy)
		{
			_examRepositoy = examRepositoy;
		}

		[HttpPost("ExamLevel")]
		public async Task<IActionResult> AddExamLevel([FromBody] CreateExamLevelDTO examLevelDto)
		{
			try
			{
				await _examRepositoy.AddExamLevelAsync(examLevelDto);

				return Ok(new { Message = "Exam level added successfully!" });
			}
			catch (Exception ex)
			{
				return StatusCode(500, new { Error = ex.Message });
			}
		}

		[HttpPost("ExamCategories")]
		public async Task<IActionResult> AddExamCategories([FromBody] CreateExamCategoriesDTO examCategoriesDto)
		{
			try
			{
				await _examRepositoy.AddExamCategoriesAsync(examCategoriesDto);

				return Ok(new { Message = "Exam categories added successfully!" });
			}
			catch (Exception ex)
			{
				return StatusCode(500, new { Error = ex.Message });
			}
		}
	}
}
