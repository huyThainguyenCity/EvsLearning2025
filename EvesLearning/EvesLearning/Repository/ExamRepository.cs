using BusinessObject.Models;
using EvesLearning.DTOs;
using EvesLearning.IRepository;
using Microsoft.EntityFrameworkCore;

namespace EvesLearning.Repository
{
	public class ExamRepository : IExamRepository
	{
		private readonly eLearningContext _context;
		public ExamRepository(eLearningContext context)
		{
			_context = context;
		}
		public async Task AddExamCategoriesAsync(CreateExamCategoriesDTO CreateExamCategories)
		{
			if (CreateExamCategories == null)
				throw new ArgumentNullException(nameof(CreateExamCategories));

			var examCategories = new ExamCategory
			{
				CategoryName = CreateExamCategories.CategoryName,
				Description = CreateExamCategories.Description,
				Deleted = CreateExamCategories.Deleted ?? 0,
				CreatedBy = CreateExamCategories.CreatedBy,
				DateCreated = CreateExamCategories.DateCreated ?? DateTime.Now
			};

			_context.ExamCategories.Add(examCategories);

			await _context.SaveChangesAsync();
		}

		public async Task AddExamLevelAsync(CreateExamLevelDTO createExamLevel)
		{
			if (createExamLevel == null)
				throw new ArgumentNullException(nameof(createExamLevel));

			var examLevel = new ExamLevel
			{
				Name = createExamLevel.Name,
				Deleted = createExamLevel.Deleted ?? 0,
				CreatedBy = createExamLevel.CreatedBy,
				DateCreated = createExamLevel.DateCreated ?? DateTime.Now
			};

			_context.ExamLevels.Add(examLevel);

			await _context.SaveChangesAsync();
		}
	}
}
