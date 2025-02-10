using BusinessObject.Models;
using EvesLearning.DTOs;

namespace EvesLearning.IRepository
{
    public interface IQuestionRepositoy
    {
        Task<IEnumerable<dynamic>> GetAllQuestionLevel();
		Task<IEnumerable<dynamic>> GetAllQuestionType();
        Task<IEnumerable<dynamic>> GetAllQuestionGroup();
		Task<IEnumerable<dynamic>> GetAllQuestionGrammar();
        Task<IEnumerable<dynamic>> GetAllQuestion();
        Task<IEnumerable<dynamic>> GetAllQuestionCategories();
        Task AddQuestionLevelAsync(CreateQuestionLevelDTO createQuestionLevel);
        Task UpdateQuestionLevelAsync(UpdateQuestionLevelDTO updateQuestionLevel);
        Task DeleteQuestionLevelAsync(int questionLevelId);
        Task AddQuestionTypeAsync(CreateQuestionTypeDTO questionType);
        Task UpdateQuestionTypeAsync(UpdateQuestionTypeDTO updateQuestionType);
        Task DeleteQuestionTypeAsync(int questionTypeId);
        Task AddQuestionGroupAsync(CreateQuestionGroupDTO questionLevel);
        Task UpdateQuestionGroupAsync(UpdateQuestionGroupDTO updateQuestionGroup);
        Task DeleteQuestionGroupAsync(int questionGroupId);
        Task AddQuestionGrammarAsync(CreateQuestionGrammarDTO createQuestionGrammar);
        Task UpdateQuestionGrammarAsync(UpdateQuestionGrammarDTO updateQuestionGrammar);
        Task DeleteQuestionGrammarAsync(int questionGrammarId);
        Task AddQuestionAsync(CreateQuestionDTO createQuestion);
        Task UpdateQuestionAsync(UpdateQuestionDTO updateQuestion);
        Task AddQuestionCategoriesAsync(CreateQuestionCategoriesDTO CreateQuestionCategories);
        Task UpdateQuestionCategoriesAsync(UpdateQuestionCategoriesDTO updateQuestionCategories);
        Task DeleteQuestionCategoriesAsync(int questionCategoriesId);
        Task<dynamic> GetQuestionByIdAsync(int questionId);
        Task<dynamic> GetQuestionLevelByIdAsync(int questionLevelId);
        Task<dynamic> GetQuestionTypeByIdAsync(int questionTypeId);
        Task<dynamic> GetQuestionGroupByIdAsync(int questionGroupId);
        Task<dynamic> GetQuestionGrammarByIdAsync(int questionGrammarId);
        Task<dynamic> GetQuestionCategoriesByIdAsync(int questionCategoriesId);
        Task<IEnumerable<AnswerResultDTO>> CheckAnswersAsync(List<UserAnswerDTO> userAnswers);
        Task ImportQuestionsFromExcelAsync(IFormFile file);
        Task<byte[]> DownloadExcelTemplateQuestion();

    }
}
