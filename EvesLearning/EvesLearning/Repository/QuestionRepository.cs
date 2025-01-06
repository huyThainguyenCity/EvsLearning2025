using BusinessObject.Models;
using EvesLearning.DTOs;
using EvesLearning.IRepository;
using Microsoft.EntityFrameworkCore;

namespace EvesLearning.Repository
{
    public class QuestionRepository : IQuestionRepositoy
    {
        private readonly eLearningContext _context;

        public QuestionRepository(eLearningContext context)
        {
            _context = context;
        }

        public async Task AddQuestionLevelAsync(QuestionLevelDTO questionLevelDTO)
        {
            if (questionLevelDTO == null)
                throw new ArgumentNullException(nameof(questionLevelDTO));

            var questionLevel = new QuestionLevel
            {
                Name = questionLevelDTO.Name,
                Status = questionLevelDTO.Status,
                Index = questionLevelDTO.Index,
                Deleted = questionLevelDTO.Deleted ?? 0,
                CreatedBy = questionLevelDTO.CreatedBy,
                DateCreated = questionLevelDTO.DateCreated ?? DateTime.Now,
                Language = questionLevelDTO.Language
            };

            _context.QuestionLevels.Add(questionLevel);

            await _context.SaveChangesAsync();
        }

        public async Task AddQuestionTypeAsync(QuestionTypeDTO questionTypeDTO)
        {
            if (questionTypeDTO == null)
                throw new ArgumentNullException(nameof(questionTypeDTO));

            var questionType = new QuestionType
            {
                Name = questionTypeDTO.Name,
                Description = questionTypeDTO.Description,
                Reference = questionTypeDTO.Reference,
                Status = questionTypeDTO.Status,
                Index = questionTypeDTO.Index,
                Deleted = questionTypeDTO.Deleted ?? 0,
                CreatedBy = questionTypeDTO.CreatedBy,
                DateCreated = questionTypeDTO.DateCreated ?? DateTime.Now,
                Language = questionTypeDTO.Language
            };

            _context.QuestionTypes.Add(questionType);

            await _context.SaveChangesAsync();
        }
    }
}
