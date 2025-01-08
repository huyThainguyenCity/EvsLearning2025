using BusinessObject.Models;
using EvesLearning.DTOs;

namespace EvesLearning.IRepository
{
    public interface IQuestionRepositoy
    {
        Task<IEnumerable<dynamic>> GetAllQuestionLevel();
        Task AddQuestionLevelAsync(CreateQuestionLevelDTO createQuestionLevel);
        Task UpdateQuestionLevelAsync(UpdateQuestionLevelDTO updateQuestionLevel);
        Task AddQuestionTypeAsync(CreateQuestionTypeDTO questionType);
        Task UpdateQuestionTypeAsync(UpdateQuestionTypeDTO updateQuestionType);
        Task AddQuestionGroupAsync(CreateQuestionGroupDTO questionLevel);
        Task UpdateQuestionGroupAsync(UpdateQuestionGroupDTO updateQuestionGroup);
        Task AddQuestionGrammarAsync(CreateQuestionGrammarDTO createQuestionGrammar);
        Task UpdateQuestionGrammarAsync(UpdateQuestionGrammarDTO updateQuestionGrammar);
        Task AddQuestionAsync(CreateQuestionDTO createQuestion);
        Task<IEnumerable<dynamic>> GetAllQuestion();
        Task<IEnumerable<AnswerResultDTO>> CheckAnswersAsync(List<UserAnswerDTO> userAnswers);

    }
}
