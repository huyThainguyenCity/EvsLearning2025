using EvesLearning.DTOs;

namespace EvesLearning.IRepository
{
    public interface IExamRepository
    {
		Task AddExamLevelAsync(CreateExamLevelDTO createExamLevel);
		Task AddExamCategoriesAsync(CreateExamCategoriesDTO CreateExamCategories);
	}
}
