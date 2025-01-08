﻿using BusinessObject.Models;
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

                return Ok(new { Message = "Question grammar added successfully!" });
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
    }
}
