﻿using BusinessObject.Models;
using EvesLearning.DTOs;
using EvesLearning.IRepository;
using EvesLearning.Repository;
using Microsoft.AspNetCore.Mvc;

namespace EvesLearning.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionController : ControllerBase
    {
        private readonly IQuestionRepositoy _questionRepositoy;

        public QuestionController(IQuestionRepositoy questionRepositoy)
        {
            _questionRepositoy = questionRepositoy;
        }

        [HttpPost("GetAllQuestionLevel")]
        public async Task<IActionResult> GetAllQuestionLevel()
        {
            try
            {
                var result = await _questionRepositoy.GetAllQuestionLevel();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Có lỗi xảy ra: {ex.Message}");
            }
        }

		[HttpPost("GetAllQuestionType")]
		public async Task<IActionResult> GetAllQuestionType()
		{
			try
			{
				var result = await _questionRepositoy.GetAllQuestionType();
				return Ok(result);
			}
			catch (Exception ex)
			{
				return BadRequest($"Có lỗi xảy ra: {ex.Message}");
			}
		}

        [HttpPost("GetAllQuestionGroup")]
        public async Task<IActionResult> GetAllQuestionGroup()
        {
            try
            {
                var result = await _questionRepositoy.GetAllQuestionGroup();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Có lỗi xảy ra: {ex.Message}");
            }
        }

		[HttpPost("GetAllQuestionGrammar")]
		public async Task<IActionResult> GetAllQuestionGrammar()
		{
			try
			{
				var result = await _questionRepositoy.GetAllQuestionGrammar();
				return Ok(result);
			}
			catch (Exception ex)
			{
				return BadRequest($"Có lỗi xảy ra: {ex.Message}");
			}
		}

		[HttpPost("GetCheckQuestion")]
        public async Task<IActionResult> GetCheckQuestion(List<UserAnswerDTO> userAnswers)
        {
            try
            {
                var result = await _questionRepositoy.CheckAnswersAsync(userAnswers);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Có lỗi xảy ra: {ex.Message}");
            }
        }

        [HttpPost("GetAllQuestion")]
        public async Task<IActionResult> GetAllQuestion()
        {
            try
            {
                var result = await _questionRepositoy.GetAllQuestion();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Có lỗi xảy ra: {ex.Message}");
            }
        }

        [HttpPost("GetAllQuestionCategories")]
        public async Task<IActionResult> GetAllQuestionCategories()
        {
            try
            {
                var result = await _questionRepositoy.GetAllQuestionCategories();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Có lỗi xảy ra: {ex.Message}");
            }
        }

        [HttpPost("QuestionLevel")]
        public async Task<IActionResult> AddQuestionLevel([FromBody] CreateQuestionLevelDTO questionLevelDto)
        {         
            try
            {
                await _questionRepositoy.AddQuestionLevelAsync(questionLevelDto);

                return Ok(new { Message = "Question level added successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPost("QuestionType")]
        public async Task<IActionResult> AddQuestionType([FromBody] CreateQuestionTypeDTO questionTypeDto)
        {          
            try
            {
                await _questionRepositoy.AddQuestionTypeAsync(questionTypeDto);

                return Ok(new { Message = "Question type added successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPost("QuestionGroup")]
        public async Task<IActionResult> AddQuestionGroup([FromBody] CreateQuestionGroupDTO questionGroupDto)
        {
            try
            {
                await _questionRepositoy.AddQuestionGroupAsync(questionGroupDto);

                return Ok(new { Message = "Question group added successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPost("QuestionGrammar")]
        public async Task<IActionResult> AddQuestionGrammar([FromBody] CreateQuestionGrammarDTO questionGrammarDto)
        {
            try
            {
                await _questionRepositoy.AddQuestionGrammarAsync(questionGrammarDto);

                return Ok(new { Message = "Question grammar added successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddQuestion([FromBody] CreateQuestionDTO questionDto)
        {
            try
            {
                await _questionRepositoy.AddQuestionAsync(questionDto);

                return Ok(new { Message = "Question added successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPost("QuestionCategories")]
        public async Task<IActionResult> AddQuestionCategories([FromBody] CreateQuestionCategoriesDTO questionCategoriesDto)
        {
            try
            {
                await _questionRepositoy.AddQuestionCategoriesAsync(questionCategoriesDto);

                return Ok(new { Message = "Question categories added successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPut("QuestionGrammar")]
        public async Task<IActionResult> UpdateQuestionGrammar([FromBody] UpdateQuestionGrammarDTO questionGrammarDto)
        {
            try
            {
                await _questionRepositoy.UpdateQuestionGrammarAsync(questionGrammarDto);

                return Ok(new { Message = "Question grammar updated successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPut("QuestionLevel")]
        public async Task<IActionResult> UpdateQuestionLevel([FromBody] UpdateQuestionLevelDTO questionLevelDto)
        {
            try
            {
                await _questionRepositoy.UpdateQuestionLevelAsync(questionLevelDto);

                return Ok(new { Message = "Question level updated successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPut("QuestionGroup")]
        public async Task<IActionResult> UpdateQuestionGroup([FromBody] UpdateQuestionGroupDTO questionGroupDto)
        {
            try
            {
                await _questionRepositoy.UpdateQuestionGroupAsync(questionGroupDto);

                return Ok(new { Message = "Question level updated successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPut("QuestionType")]
        public async Task<IActionResult> UpdateQuestionType([FromBody] UpdateQuestionTypeDTO questionTypeDto)
        {
            try
            {
                await _questionRepositoy.UpdateQuestionTypeAsync(questionTypeDto);

                return Ok(new { Message = "Question type updated successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPut("QuestionCategories")]
        public async Task<IActionResult> UpdateQuestionCategories([FromBody] UpdateQuestionCategoriesDTO questionCategoriesDto)
        {
            try
            {
                await _questionRepositoy.UpdateQuestionCategoriesAsync(questionCategoriesDto);

                return Ok(new { Message = "Question categories updated successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpPut]
        public async Task<IActionResult> UpdateQuestion([FromBody] UpdateQuestionDTO questionDto)
        {
            try
            {
                await _questionRepositoy.UpdateQuestionAsync(questionDto);

                return Ok(new { Message = "Question updated successfully!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetQuestionById(int id)
        {
            var questions = await _questionRepositoy.GetQuestionByIdAsync(id);

            if (questions == null)
            {
                return NotFound("Question not found");
            }

            return Ok(questions);
        }

        [HttpGet("QuestionType/{id}")]
        public async Task<IActionResult> GetQuestionTypeById(int id)
        {
            var questions = await _questionRepositoy.GetQuestionTypeByIdAsync(id);

            if (questions == null)
            {
                return NotFound("Question type not found");
            }

            return Ok(questions);
        }

        [HttpGet("QuestionGroup/{id}")]
        public async Task<IActionResult> GetQuestionGroupById(int id)
        {
            var questions = await _questionRepositoy.GetQuestionGroupByIdAsync(id);

            if (questions == null)
            {
                return NotFound("Question group not found");
            }

            return Ok(questions);
        }

        [HttpGet("QuestionGrammar/{id}")]
        public async Task<IActionResult> GetQuestionGrammarById(int id)
        {
            var questions = await _questionRepositoy.GetQuestionGrammarByIdAsync(id);

            if (questions == null)
            {
                return NotFound("Question grammar not found");
            }

            return Ok(questions);
        }

        [HttpGet("QuestionLevel/{id}")]
        public async Task<IActionResult> GetQuestionLevelById(int id)
        {
            var questions = await _questionRepositoy.GetQuestionLevelByIdAsync(id);

            if (questions == null)
            {
                return NotFound("Question level not found");
            }

            return Ok(questions);
        }

        [HttpGet("QuestionCategories/{id}")]
        public async Task<IActionResult> GetQuestionCategoriesById(int id)
        {
            var questions = await _questionRepositoy.GetQuestionCategoriesByIdAsync(id);

            if (questions == null)
            {
                return NotFound("Question categories not found");
            }

            return Ok(questions);
        }

        [HttpDelete("QuestionType/{id}")]
        public async Task<IActionResult> DeleteQuestionTypeById(int id)
        {
            try
            {
                await _questionRepositoy.DeleteQuestionTypeAsync(id);
                return Ok(new { Message = "Question type deleted successfully!" });
            }
            catch (KeyNotFoundException)
            {
                return NotFound(new { Error = "Question type not found." });
            }
            catch (ArgumentException ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpDelete("QuestionLevel/{id}")]
        public async Task<IActionResult> DeleteQuestionLevelById(int id)
        {
            try
            {
                await _questionRepositoy.DeleteQuestionLevelAsync(id);
                return Ok(new { Message = "Question level deleted successfully!" });
            }
            catch (KeyNotFoundException)
            {
                return NotFound(new { Error = "Question level not found." });
            }
            catch (ArgumentException ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpDelete("QuestionGroup/{id}")]
        public async Task<IActionResult> DeleteQuestionGroupById(int id)
        {
            try
            {
                await _questionRepositoy.DeleteQuestionGroupAsync(id);
                return Ok(new { Message = "Question group deleted successfully!" });
            }
            catch (KeyNotFoundException)
            {
                return NotFound(new { Error = "Question group not found." });
            }
            catch (ArgumentException ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpDelete("QuestionGrammar/{id}")]
        public async Task<IActionResult> DeleteQuestionGrammarById(int id)
        {
            try
            {
                await _questionRepositoy.DeleteQuestionGrammarAsync(id);
                return Ok(new { Message = "Question grammar deleted successfully!" });
            }
            catch (KeyNotFoundException)
            {
                return NotFound(new { Error = "Question grammar not found." });
            }
            catch (ArgumentException ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

        [HttpDelete("QuestionCategories/{id}")]
        public async Task<IActionResult> DeleteQuestionCategoriesById(int id)
        {
            try
            {
                await _questionRepositoy.DeleteQuestionCategoriesAsync(id);
                return Ok(new { Message = "Question categories deleted successfully!" });
            }
            catch (KeyNotFoundException)
            {
                return NotFound(new { Error = "Question categories not found." });
            }
            catch (ArgumentException ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = ex.Message });
            }
        }

		[HttpDelete("{id}")]
		public async Task<IActionResult> DeleteQuestionById(int id)
		{
			try
			{
				await _questionRepositoy.DeleteQuestionAsync(id);
				return Ok(new { Message = "Question deleted successfully!" });
			}
			catch (KeyNotFoundException)
			{
				return NotFound(new { Error = "Question not found." });
			}
			catch (ArgumentException ex)
			{
				return BadRequest(new { Error = ex.Message });
			}
			catch (Exception ex)
			{
				return StatusCode(500, new { Error = ex.Message });
			}
		}

		[HttpPost("import")]
        public async Task<IActionResult> ImportQuestions(IFormFile file)
        {
            try
            {
                await _questionRepositoy.ImportQuestionsFromExcelAsync(file);
                return Ok(new { message = "Import câu hỏi thành công!" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = $"Lỗi khi import file: {ex.Message}" });
            }
        }

        [HttpGet("download-template")]
        public async Task<IActionResult> DownloadExcelTemplateQuestion()
        {
            var fileBytes = await _questionRepositoy.DownloadExcelTemplateQuestion();
            var fileName = "MauImport_CauHoi.xlsx";
            var contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            return File(fileBytes, contentType, fileName);
        }

    }
}
