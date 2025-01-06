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

        [HttpPost("QuestionLevel")]
        public async Task<IActionResult> AddQuestionLevel([FromBody] QuestionLevelDTO questionLevelDto)
        {
            if (questionLevelDto == null)
            {
                return BadRequest(new { Error = "Question level data cannot be null" });
            }

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
    }
}
