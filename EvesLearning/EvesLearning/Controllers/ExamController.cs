﻿using EvesLearning.DTOs;
using EvesLearning.IRepository;
using EvesLearning.Repository;
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

		[HttpPost("GetAllExam")]
		public async Task<IActionResult> GetAllExam()
		{
			try
			{
				var result = await _examRepositoy.GetAllExam();
				return Ok(result);
			}
			catch (Exception ex)
			{
				return BadRequest($"Có lỗi xảy ra: {ex.Message}");
			}
		}

        [HttpPost("GetAllQuestionOfExam")]
        public async Task<IActionResult> GetAllExamOfQuestion([FromBody] ExamRequestModel request)
        {
            try
            {
                var result = await _examRepositoy.GetAllQuestionOfExam(new ExamRequestModel { Id = request.Id });
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Có lỗi xảy ra: {ex.Message}");
            }
        }

        [HttpPost]
		public async Task<IActionResult> AddExam([FromBody] CreateExamDTO examDto)
		{
			try
			{
				var createdExams = await _examRepositoy.AddExamAsync(examDto);
				// Trả về danh sách các ExamViewModel sau khi tạo thành công
				return Ok(new { Message = "Exam added successfully!", Data = createdExams });
			}
			catch (Exception ex)
			{
				return StatusCode(500, new { Error = ex.Message });
			}
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

		[HttpPost("ExamResult")]
		public async Task<IActionResult> AddExamResults([FromBody] List<CreateExamResultDTO> examResultDtos)
		{
			try
			{
				if (examResultDtos == null || examResultDtos.Count == 0)
				{
					return BadRequest(new { Error = "Danh sách kết quả bài thi trống!" });
				}

				await _examRepositoy.AddExamResultAsync(examResultDtos); // Gọi phương thức mới (danh sách)

				return Ok(new { Message = "Exam results added successfully!" });
			}
			catch (Exception ex)
			{
				return StatusCode(500, new { Error = ex.Message });
			}
		}

		[HttpGet("export/{examId}")]
        public async Task<IActionResult> ExportExamToExcel(int examId)
        {
            try
            {
                var fileBytes = await _examRepositoy.ExportExamToExcel(examId);
                if (fileBytes == null || fileBytes.Length == 0)
                {
                    return NotFound("Không có dữ liệu để xuất.");
                }

                string fileName = $"Exam_{examId}.xlsx";
                return File(fileBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
            }
            catch (Exception ex)
            {
                return BadRequest($"Lỗi khi xuất Excel: {ex.Message}");
            }
        }
    }
}
