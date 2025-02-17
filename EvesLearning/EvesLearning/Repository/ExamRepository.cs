﻿using BusinessObject.Models;
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

        public async Task AddExamAsync(CreateExamDTO createExam)
        {
            if (createExam == null)
                throw new ArgumentNullException(nameof(createExam));

            if (createExam.ExamCount <= 0)
                throw new ArgumentException("Số lượng đề thi phải lớn hơn 0.");

            List<Exam> createdExams = new List<Exam>();

            for (int i = 0; i < createExam.ExamCount; i++)
            {
                List<Question> selectedQuestions = new List<Question>();

                foreach (var level in createExam.QuestionLevels)
                {
                    int levelId = level.Key;
                    int questionCount = level.Value;

                    var questions = await _context.Questions
                        .Where(q => q.QuestionLevelId == levelId)
                        .OrderBy(q => Guid.NewGuid()) // Random câu hỏi
                        .Take(questionCount)
                        .ToListAsync();

                    if (questions.Count < questionCount)
                        throw new InvalidOperationException($"Không đủ câu hỏi cho level {levelId}");

                    selectedQuestions.AddRange(questions);
                }

                var exam = new Exam
                {
                    ExamCategoryId = createExam.ExamCategoryID,
                    Name = $"{createExam.Name} - Đề {i + 1}",
                    FullTime = createExam.FullTime,
                    Total = selectedQuestions.Count,
                    Deleted = createExam.Deleted ?? 0,
                    CreatedBy = createExam.CreatedBy,
                    DateCreated = createExam.DateCreated ?? DateTime.Now,
                    QuestionListId = string.Join(",", selectedQuestions.Select(q => q.Id)) // Lưu danh sách ID câu hỏi dưới dạng chuỗi
                };

                _context.Exams.Add(exam);
                await _context.SaveChangesAsync();

                createdExams.Add(exam);
            }
            //return createdExams.Select(e => new { e.Id, e.Name, e.QuestionListId }).ToList();

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
