using EvesLearning.DTOs;

namespace EvesLearning.IRepository
{
    public interface IExamRepository
    {
		Task<IEnumerable<dynamic>> GetAllExam();
		Task AddExamLevelAsync(CreateExamLevelDTO createExamLevel);
		Task AddExamCategoriesAsync(CreateExamCategoriesDTO CreateExamCategories);
        Task<List<ExamViewModel>> AddExamAsync(CreateExamDTO createExam);
    }
}
