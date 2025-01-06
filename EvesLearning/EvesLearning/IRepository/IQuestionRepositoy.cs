using EvesLearning.DTOs;

namespace EvesLearning.IRepository
{
    public interface IQuestionRepositoy
    {
        Task AddQuestionLevelAsync(QuestionLevelDTO questionLevel);
        Task AddQuestionTypeAsync(QuestionTypeDTO questionType);

    }
}
