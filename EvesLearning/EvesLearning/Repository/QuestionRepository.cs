using BusinessObject.Models;
using EvesLearning.DTOs;
using EvesLearning.IRepository;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using Dapper;
using Microsoft.AspNetCore.Mvc;

namespace EvesLearning.Repository
{
    public class QuestionRepository : IQuestionRepositoy
    {
        private readonly eLearningContext _context;

        public QuestionRepository(eLearningContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<dynamic>> GetAllQuestion()
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                var result = await connection.QueryAsync(
                    "EL_GetAllQuestion",
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error calling stored procedure: {ex.Message}");
            }
        }
        public async Task<IEnumerable<dynamic>> GetAllQuestionLevel()
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                var result = await connection.QueryAsync(
                    "EL_GetAllQuestionLevel",
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error calling stored procedure: {ex.Message}");
            }
        }
		public async Task<IEnumerable<dynamic>> GetAllQuestionType()
		{
			try
			{
				var connectionString = _context.Database.GetDbConnection().ConnectionString;

				using var connection = new SqlConnection(connectionString);
				await connection.OpenAsync();

				var result = await connection.QueryAsync(
					"EL_GetAllQuestionType",
					commandType: CommandType.StoredProcedure
				);

				return result;
			}
			catch (Exception ex)
			{
				throw new Exception($"Error calling stored procedure: {ex.Message}");
			}
		}
        public async Task<IEnumerable<dynamic>> GetAllQuestionGroup()
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                var result = await connection.QueryAsync(
                    "EL_GetAllQuestionGroups",
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error calling stored procedure: {ex.Message}");
            }
        }
		public async Task<IEnumerable<dynamic>> GetAllQuestionGrammar()
		{
			try
			{
				var connectionString = _context.Database.GetDbConnection().ConnectionString;

				using var connection = new SqlConnection(connectionString);
				await connection.OpenAsync();

				var result = await connection.QueryAsync(
					"EL_GetAllQuestionGrammar",
					commandType: CommandType.StoredProcedure
				);

				return result;
			}
			catch (Exception ex)
			{
				throw new Exception($"Error calling stored procedure: {ex.Message}");
			}
		}

		public async Task AddQuestionGrammarAsync(CreateQuestionGrammarDTO createQuestionGrammar)
        {
            if (createQuestionGrammar == null)
                throw new ArgumentNullException(nameof(createQuestionGrammar));

            var questionGrammar = new QuestionGrammar
            {
                Type = createQuestionGrammar.Type,
                Name = createQuestionGrammar.Name,
                ShortContent = createQuestionGrammar.ShortContent,
                Content = createQuestionGrammar.Content,
                Viewer = createQuestionGrammar.Viewer,
                Image = createQuestionGrammar.Image,
                Status = createQuestionGrammar.Status,
                Index = createQuestionGrammar.Index,
                Deleted = createQuestionGrammar.Deleted ?? 0,
                CreatedBy = createQuestionGrammar.CreatedBy,
                DateCreated = createQuestionGrammar.DateCreated ?? DateTime.Now,
                Language = createQuestionGrammar.Language
            };

            _context.QuestionGrammars.Add(questionGrammar);

            await _context.SaveChangesAsync();
        }

        public async Task AddQuestionGroupAsync(CreateQuestionGroupDTO questionLevelDTO)
        {
            if (questionLevelDTO == null)
                throw new ArgumentNullException(nameof(questionLevelDTO));

            var questionLevel = new QuestionGroup
            {
                Name = questionLevelDTO.Name,
                Description = questionLevelDTO.Description,
                Reference = questionLevelDTO.Reference,
                Status = questionLevelDTO.Status,
                Index = questionLevelDTO.Index,
                Deleted = questionLevelDTO.Deleted ?? 0,
                CreatedBy = questionLevelDTO.CreatedBy,
                DateCreated = questionLevelDTO.DateCreated ?? DateTime.Now,
                Language = questionLevelDTO.Language
            };

            _context.QuestionGroups.Add(questionLevel);

            await _context.SaveChangesAsync();
        }

        public async Task AddQuestionLevelAsync(CreateQuestionLevelDTO questionLevelDTO)
        {
            if (questionLevelDTO == null)
                throw new ArgumentNullException(nameof(questionLevelDTO));

            var questionLevel = new QuestionLevel
            {
                Name = questionLevelDTO.Name,
                Status = questionLevelDTO.Status ?? 0,
                Index = questionLevelDTO.Index ?? 0,
                Deleted = questionLevelDTO.Deleted ?? 0,
                CreatedBy = questionLevelDTO.CreatedBy,
                DateCreated = questionLevelDTO.DateCreated ?? DateTime.Now,
                Language = questionLevelDTO.Language ?? 0
            };

            _context.QuestionLevels.Add(questionLevel);

            await _context.SaveChangesAsync();
        }

        public async Task AddQuestionTypeAsync(CreateQuestionTypeDTO questionTypeDTO)
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
        public async Task AddQuestionAsync(CreateQuestionDTO createQuestion)
        {
            if (createQuestion == null)
                throw new ArgumentNullException(nameof(createQuestion));

            var question = new Question
            {
                Name = createQuestion.Name,
                Answer1 = createQuestion.Answer1,
                Answer2 = createQuestion.Answer2,
                Answer3 = createQuestion.Answer3,
                Answer4 = createQuestion.Answer4,
                Correct = createQuestion.Correct,
                CreatedBy = createQuestion.CreatedBy,
                DateCreated = createQuestion.DateCreated ?? DateTime.Now
            };

            _context.Questions.Add(question);

            await _context.SaveChangesAsync();
        }

        public async Task UpdateQuestionGrammarAsync(UpdateQuestionGrammarDTO updateQuestionGrammar)
        {
            if (updateQuestionGrammar == null)
            {
                throw new ArgumentNullException(nameof(updateQuestionGrammar), "Question grammar cannot be null");
            }

            var existingQuestionGrammar = await _context.QuestionGrammars.FirstOrDefaultAsync(q => q.Id == updateQuestionGrammar.Id)
                           ?? throw new KeyNotFoundException($"ID {updateQuestionGrammar.Id} not found.");

            existingQuestionGrammar.Name = updateQuestionGrammar.Name;
            existingQuestionGrammar.Type = updateQuestionGrammar.Type;
            existingQuestionGrammar.ShortContent = updateQuestionGrammar.ShortContent;
            existingQuestionGrammar.Content = updateQuestionGrammar.Content;
            existingQuestionGrammar.Viewer = updateQuestionGrammar.Viewer;
            existingQuestionGrammar.Image = updateQuestionGrammar.Image;
            existingQuestionGrammar.Status = updateQuestionGrammar.Status;
            existingQuestionGrammar.Index = updateQuestionGrammar.Index;
            existingQuestionGrammar.Deleted = updateQuestionGrammar.Deleted ?? existingQuestionGrammar.Deleted;
            existingQuestionGrammar.Language = updateQuestionGrammar.Language;
            existingQuestionGrammar.ModifyBy = updateQuestionGrammar.ModifyBy;
            existingQuestionGrammar.DateModify = DateTime.UtcNow;

            await _context.SaveChangesAsync();
        }

        public async Task UpdateQuestionGroupAsync(UpdateQuestionGroupDTO updateQuestionGroup)
        {
            if (updateQuestionGroup == null)
            {
                throw new ArgumentNullException(nameof(updateQuestionGroup), "Question group cannot be null");
            }

            var existingQuestionGroup = await _context.QuestionGroups.FirstOrDefaultAsync(q => q.Id == updateQuestionGroup.Id)
                           ?? throw new KeyNotFoundException($"ID {updateQuestionGroup.Id} not found.");

            existingQuestionGroup.Name = updateQuestionGroup.Name;
            existingQuestionGroup.Description = updateQuestionGroup.Description;
            existingQuestionGroup.Reference = updateQuestionGroup.Reference;
            existingQuestionGroup.Status = updateQuestionGroup.Status;
            existingQuestionGroup.Index = updateQuestionGroup.Index;
            existingQuestionGroup.Deleted = updateQuestionGroup.Deleted ?? existingQuestionGroup.Deleted;
            existingQuestionGroup.Language = updateQuestionGroup.Language;
            existingQuestionGroup.ModifyBy = updateQuestionGroup.ModifyBy;
            existingQuestionGroup.DateModify = DateTime.UtcNow;

            await _context.SaveChangesAsync();
        }

        public async Task UpdateQuestionLevelAsync(UpdateQuestionLevelDTO questionLevel)
        {
            if (questionLevel == null)
            {
                throw new ArgumentNullException(nameof(questionLevel), "Question level cannot be null");
            }

            var existingQuestionLevel = await _context.QuestionLevels.FirstOrDefaultAsync(q => q.Id == questionLevel.Id)
                           ?? throw new KeyNotFoundException($"ID {questionLevel.Id} not found.");

            existingQuestionLevel.Name = questionLevel.Name;
            existingQuestionLevel.Status = questionLevel.Status;
            existingQuestionLevel.Index = questionLevel.Index;
            existingQuestionLevel.Deleted = questionLevel.Deleted ?? existingQuestionLevel.Deleted;
            existingQuestionLevel.Language = questionLevel.Language;
            existingQuestionLevel.ModifyBy = questionLevel.ModifyBy;
            existingQuestionLevel.DateModify = DateTime.UtcNow;

            await _context.SaveChangesAsync();
        }

        public async Task UpdateQuestionTypeAsync(UpdateQuestionTypeDTO updateQuestionType)
        {
            if (updateQuestionType == null)
            {
                throw new ArgumentNullException(nameof(updateQuestionType), "Question type cannot be null");
            }

            var existingQuestionType = await _context.QuestionTypes.FirstOrDefaultAsync(q => q.Id == updateQuestionType.Id)
                           ?? throw new KeyNotFoundException($"ID {updateQuestionType.Id} not found.");

            existingQuestionType.Name = updateQuestionType.Name;
            existingQuestionType.Description = updateQuestionType.Description;
            existingQuestionType.Reference = updateQuestionType.Reference;
            existingQuestionType.Status = updateQuestionType.Status;
            existingQuestionType.Index = updateQuestionType.Index;
            existingQuestionType.Deleted = updateQuestionType.Deleted ?? existingQuestionType.Deleted;
            existingQuestionType.Language = updateQuestionType.Language;
            existingQuestionType.ModifyBy = updateQuestionType.ModifyBy;
            existingQuestionType.DateModify = DateTime.UtcNow;

            await _context.SaveChangesAsync();
        }
        public async Task UpdateQuestionAsync(UpdateQuestionDTO updateQuestion)
        {
            if (updateQuestion == null)
            {
                throw new ArgumentNullException(nameof(updateQuestion), "Question cannot be null");
            }

            var existingQuestion = await _context.Questions.FirstOrDefaultAsync(q => q.Id == updateQuestion.Id)
                           ?? throw new KeyNotFoundException($"ID {updateQuestion.Id} not found.");

            existingQuestion.Name = updateQuestion.Name;
            existingQuestion.Answer1 = updateQuestion.Answer1;
            existingQuestion.Answer2 = updateQuestion.Answer2;
            existingQuestion.Answer3 = updateQuestion.Answer3;
            existingQuestion.Answer4 = updateQuestion.Answer4;
            existingQuestion.Correct = updateQuestion.Correct;
            existingQuestion.ModifyBy = updateQuestion.ModifyBy;
            existingQuestion.DateModify = DateTime.UtcNow;

            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<AnswerResultDTO>> CheckAnswersAsync(List<UserAnswerDTO> userAnswers)
        {
            var questions = await GetAllQuestion();

            var results = userAnswers.Select(userAnswer =>
            {
                // Tìm câu hỏi trong danh sách
                var question = questions.FirstOrDefault(q => q.ID == userAnswer.QuestionId);

                if (question == null)
                {
                    return new AnswerResultDTO
                    {
                        QuestionId = userAnswer.QuestionId,
                        IsCorrect = false,
                        CorrectAnswer = string.Empty // hoặc gán null, tùy trường hợp
                    };
                }
                // Kiểm tra nếu người dùng không chọn câu trả lời
                if (string.IsNullOrEmpty(userAnswer.SelectedAnswer))
                {
                    return new AnswerResultDTO
                    {
                        QuestionId = userAnswer.QuestionId,
                        IsCorrect = false,
                        CorrectAnswer = question.Correct // Hiển thị đáp án đúng
                    };
                }

                // Kiểm tra nếu câu trả lời của người dùng đúng
                var isCorrect = question.Correct == userAnswer.SelectedAnswer;

                return new AnswerResultDTO
                {
                    QuestionId = userAnswer.QuestionId,
                    IsCorrect = isCorrect,
                    CorrectAnswer = question.Correct
                };
            });

            return results;
        }
    }
}
