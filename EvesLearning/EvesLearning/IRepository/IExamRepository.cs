using EvesLearning.DTOs;

namespace EvesLearning.IRepository
{
    public interface IExamRepository
    {
		Task<IEnumerable<dynamic>> GetAllExam();
        Task<IEnumerable<dynamic>> GetAllQuestionOfExam(ExamRequestModel request);
        Task AddExamLevelAsync(CreateExamLevelDTO createExamLevel);
		Task AddExamCategoriesAsync(CreateExamCategoriesDTO CreateExamCategories);
        Task<List<ExamViewModel>> AddExamAsync(CreateExamDTO createExam);
		Task AddExamResultAsync(List<CreateExamResultDTO> createExamResult);
		Task<byte[]> ExportExamToExcel(int examId);
    }
}
