﻿using BusinessObject.Models;
using ClosedXML.Excel;
using Dapper;
using EvesLearning.DTOs;
using EvesLearning.IRepository;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace EvesLearning.Repository
{
	public class ExamRepository : IExamRepository
	{
		private readonly eLearningContext _context;
		public ExamRepository(eLearningContext context)
		{
			_context = context;
		}
		public async Task<IEnumerable<dynamic>> GetAllExam()
		{
			try
			{
				var connectionString = _context.Database.GetDbConnection().ConnectionString;

				using var connection = new SqlConnection(connectionString);
				await connection.OpenAsync();

				var result = await connection.QueryAsync(
					"EL_GetAllExam",
					commandType: CommandType.StoredProcedure
				);

				return result;
			}
			catch (Exception ex)
			{
				throw new Exception($"Error calling stored procedure: {ex.Message}");
			}
		}

		public async Task<List<ExamViewModel>> AddExamAsync(CreateExamDTO createExam)
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
			var result = createdExams.Select(e => new ExamViewModel
			{
				Id = e.Id,
				Name = e.Name,
				QuestionListId = e.QuestionListId
			}).ToList();
			return result;
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

        public async Task<byte[]> ExportExamToExcel(int examId)
        {
            try
            {
                var connectionString = _context.Database.GetDbConnection().ConnectionString;

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                // Gọi Stored Procedure với tham số @ExamID
                var result = await connection.QueryAsync<dynamic>(
                    "EL_GetAllQuestionExam",
                    new { ExamID = examId }, // Truyền tham số cho SP
                    commandType: CommandType.StoredProcedure
                );

                var listData = result.ToList();
                if (listData.Count == 0)
                {
                    throw new Exception("Không có dữ liệu để xuất.");
                }

                // Tạo DataTable để lưu dữ liệu
                DataTable dt = new DataTable();
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Answer1", typeof(string));
                dt.Columns.Add("Answer2", typeof(string));
                dt.Columns.Add("Answer3", typeof(string));
                dt.Columns.Add("Answer4", typeof(string));
                dt.Columns.Add("Correct", typeof(string));

                // Đổ dữ liệu vào DataTable
                foreach (var item in listData)
                {
                    dt.Rows.Add(item.Name, item.Answer1, item.Answer2, item.Answer3, item.Answer4, item.Correct);
                }

                using (var workbook = new XLWorkbook())
                {
                    var worksheet = workbook.Worksheets.Add("Exam Questions");

                    // Ghi tiêu đề cột
                    worksheet.Cell(1, 1).Value = "Name";
                    worksheet.Cell(1, 2).Value = "Answer1";
                    worksheet.Cell(1, 3).Value = "Answer2";
                    worksheet.Cell(1, 4).Value = "Answer3";
                    worksheet.Cell(1, 5).Value = "Answer4";
                    worksheet.Cell(1, 6).Value = "Correct";

                    // Đổ dữ liệu vào Excel
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        worksheet.Cell(i + 2, 1).Value = dt.Rows[i]["Name"]?.ToString() ?? "";
                        worksheet.Cell(i + 2, 2).Value = dt.Rows[i]["Answer1"]?.ToString() ?? "";
                        worksheet.Cell(i + 2, 3).Value = dt.Rows[i]["Answer2"]?.ToString() ?? "";
                        worksheet.Cell(i + 2, 4).Value = dt.Rows[i]["Answer3"]?.ToString() ?? "";
                        worksheet.Cell(i + 2, 5).Value = dt.Rows[i]["Answer4"]?.ToString() ?? "";
                        worksheet.Cell(i + 2, 6).Value = dt.Rows[i]["Correct"]?.ToString() ?? "";
                    }

                    worksheet.Columns().AdjustToContents(); // Canh chỉnh cột

                    using (var stream = new MemoryStream())
                    {
                        workbook.SaveAs(stream);
                        return stream.ToArray(); // Trả về file Excel dạng byte[]
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception($"Lỗi khi xuất Excel: {ex.Message}");
            }
        }
    }
}
