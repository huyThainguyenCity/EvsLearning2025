using BusinessObject.Models;
using EvesLearning.DTOs;
using EvesLearning.IRepository;
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
    }
}
