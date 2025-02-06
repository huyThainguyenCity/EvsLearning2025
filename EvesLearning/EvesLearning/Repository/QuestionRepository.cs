using BusinessObject.Models;
using EvesLearning.DTOs;
using EvesLearning.IRepository;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

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

            // Chuyển danh sách Correct thành chuỗi "2,3"
            string correctAnswers = string.Join(",", createQuestion.Correct);

            var question = new Question
            {
                Name = createQuestion.Name,
                Answer1 = createQuestion.Answer1,
                Answer2 = createQuestion.Answer2,
                Answer3 = createQuestion.Answer3,
                Answer4 = createQuestion.Answer4,
                Correct = correctAnswers,
                QuestionCategoryId = createQuestion.QuestionCategoryID,
                QuestionLevelId = createQuestion.QuestionLevelID,
                CreatedBy = createQuestion.CreatedBy,
                DateCreated = createQuestion.DateCreated ?? DateTime.Now
            };

            _context.Questions.Add(question);

            await _context.SaveChangesAsync();

            foreach (var correctAnswer in createQuestion.Correct)
            {
                var questionAnswer = new QuestionAnswer
                {
                    QuestionId = question.Id,
                    AnswerName = createQuestion.Name,
                    Correct = correctAnswer.ToString(),
                    CreatedBy = createQuestion.CreatedBy,
                    DateCreated = createQuestion.DateCreated ?? DateTime.Now
                };

                _context.QuestionAnswers.Add(questionAnswer);
            }
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
            existingQuestion.Correct = string.Join(",", updateQuestion.Correct);
            existingQuestion.QuestionCategoryId = updateQuestion.QuestionCategoryID;
            existingQuestion.QuestionLevelId = updateQuestion.QuestionLevelID;
            existingQuestion.ModifyBy = updateQuestion.ModifyBy;
            existingQuestion.DateModify = DateTime.UtcNow;

            await _context.SaveChangesAsync();

            var existingAnswers = await _context.QuestionAnswers.Where(qa => qa.QuestionId == existingQuestion.Id).ToListAsync();

            // Tạo danh sách các câu trả lời mới từ mảng Correct
            var correctAnswers = updateQuestion.Correct.Select(c => c.ToString()).ToList();

            // Cập nhật hoặc thêm mới các câu trả lời đúng
            foreach (var correctAnswer in correctAnswers)
            {
                // Tìm câu trả lời trong bảng QuestionAnswers
                var existingAnswer = existingAnswers.FirstOrDefault(qa => qa.Correct == correctAnswer);

                if (existingAnswer != null)
                {
                    // Nếu câu trả lời đã tồn tại, cập nhật thông tin
                    existingAnswer.AnswerName = updateQuestion.Name;
                    existingAnswer.ModifyBy = updateQuestion.ModifyBy;
                    existingAnswer.DateModify = DateTime.UtcNow;
                }
                else
                {
                    // Nếu chưa có câu trả lời đúng mới, thêm vào bảng QuestionAnswers
                    _context.QuestionAnswers.Add(new QuestionAnswer
                    {
                        QuestionId = updateQuestion.Id,
                        AnswerName = updateQuestion.Name,
                        Correct = correctAnswer,
                        ModifyBy = updateQuestion.ModifyBy,
                        DateModify = DateTime.UtcNow
                    });
                }
            }

            // Xóa các câu trả lời không còn đúng (không có trong mảng Correct)
            var answersToRemove = existingAnswers
                .Where(qa => !correctAnswers.Contains(qa.Correct)) // Lọc ra các câu trả lời không còn đúng
                .ToList();

            // Xóa những câu trả lời không còn đúng
            _context.QuestionAnswers.RemoveRange(answersToRemove);

            // Lưu các thay đổi vào cơ sở dữ liệu
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<AnswerResultDTO>> CheckAnswersAsync(List<UserAnswerDTO> userAnswers)
        {
            var questions = await GetAllQuestion();

            var results = userAnswers.Select(userAnswer =>
            {
                var question = questions.FirstOrDefault(q => q.ID == userAnswer.QuestionId);

                if (question == null)
                {
                    return new AnswerResultDTO
                    {
                        QuestionId = userAnswer.QuestionId,
                        IsCorrect = false,
                        CorrectAnswer = string.Empty
                    };
                }
                string selectedAnswer = string.Join(",", userAnswer.SelectedAnswer);

                if (string.IsNullOrEmpty(selectedAnswer))
                {
                    return new AnswerResultDTO
                    {
                        QuestionId = userAnswer.QuestionId,
                        IsCorrect = false,
                        CorrectAnswer = question.Correct
                    };
                }

                string correctAnswer = string.Join(",", question.Correct);

                var correctAnswers = (question.Correct as string ?? "").Split(',').Select(x => x.Trim()).ToList();
                var selectedAnswers = (userAnswer.SelectedAnswer as string ?? "").Split(',').Select(x => x.Trim()).ToList();


                var isCorrect = selectedAnswers.All(answer => correctAnswers.Contains(answer))
                               && correctAnswers.Count == selectedAnswers.Count;

                return new AnswerResultDTO
                {
                    QuestionId = userAnswer.QuestionId,
                    IsCorrect = isCorrect,
                    CorrectAnswer = string.Join(",", correctAnswer)
                };
            });

            return results;
        }

        public async Task<dynamic> GetQuestionByIdAsync(int questionId)
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                var result = await connection.QueryFirstOrDefaultAsync(
                    "EL_GetDetailQuestion",
                    new { id = questionId },
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error calling stored procedure: {ex.Message}");
            }
        }

        public async Task<dynamic> GetQuestionLevelByIdAsync(int questionLevelId)
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                var result = await connection.QueryFirstOrDefaultAsync(
                    "EL_GetDetailQuestionLevel",
                    new { id = questionLevelId },
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error calling stored procedure: {ex.Message}");
            }
        }

        public async Task<dynamic> GetQuestionTypeByIdAsync(int questionTypeId)
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                var result = await connection.QueryFirstOrDefaultAsync(
                    "EL_GetDetailQuestionType",
                    new { id = questionTypeId },
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error calling stored procedure: {ex.Message}");
            }
        }

        public async Task<dynamic> GetQuestionGroupByIdAsync(int questionGroupId)
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                var result = await connection.QueryFirstOrDefaultAsync(
                    "EL_GetDetailQuestionGroups",
                    new { id = questionGroupId },
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error calling stored procedure: {ex.Message}");
            }
        }

        public async Task<dynamic> GetQuestionGrammarByIdAsync(int questionGrammarId)
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                var result = await connection.QueryFirstOrDefaultAsync(
                    "EL_GetDetailQuestionGrammar",
                    new { id = questionGrammarId },
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error calling stored procedure: {ex.Message}");
            }
        }

        public async Task AddQuestionCategoriesAsync(CreateQuestionCategoriesDTO CreateQuestionCategories)
        {
            if (CreateQuestionCategories == null)
                throw new ArgumentNullException(nameof(CreateQuestionCategories));

            var questionCategories = new QuestionCategory
            {
                Name = CreateQuestionCategories.Name,
                ShortContent = CreateQuestionCategories.ShortContent,
                Contents = CreateQuestionCategories.Contents,
                Contents2 = CreateQuestionCategories.Contents2,
                CreatedBy = CreateQuestionCategories.CreatedBy,
                DateCreated = CreateQuestionCategories.DateCreated ?? DateTime.Now
            };

            _context.QuestionCategories.Add(questionCategories);

            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<dynamic>> GetAllQuestionCategories()
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                var result = await connection.QueryAsync(
                    "EL_GetAllQuestionCategories",
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error calling stored procedure: {ex.Message}");
            }
        }
    }
}
