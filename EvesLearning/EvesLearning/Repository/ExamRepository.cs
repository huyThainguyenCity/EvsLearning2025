using BusinessObject.Models;
using ClosedXML.Excel;
using Dapper;
using EvesLearning.DTOs;
using EvesLearning.IRepository;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Text.RegularExpressions;

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

                // Gọi Stored Procedure lấy dữ liệu
                var result = await connection.QueryAsync<dynamic>(
                    "EL_GetAllQuestionExam",
                    new { ExamID = examId },
                    commandType: CommandType.StoredProcedure
                );

                var listData = result.ToList();
                if (listData.Count == 0)
                {
                    throw new Exception("Không có dữ liệu để xuất.");
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

                    int rowIndex = 2;

                    foreach (var item in listData)
                    {
                        string nameField = item.Name?.ToString() ?? "";
                        string imagePath = ExtractImageFromBase64(nameField);

                        if (!string.IsNullOrEmpty(imagePath))
                        {
                            // Nếu có ảnh, giữ nguyên text và chèn ảnh vào ô
                            worksheet.Cell(rowIndex, 1).Value = RemoveBase64FromText(nameField);
                            var img = worksheet.AddPicture(imagePath)
                                .MoveTo(worksheet.Cell(rowIndex, 1))
                                .Scale(0.1); // Điều chỉnh kích thước ảnh để vừa ô

                            worksheet.Row(rowIndex).Height = 120; // Tăng chiều cao dòng
                        }
                        else
                        {
                            worksheet.Cell(rowIndex, 1).Value = nameField;
                        }

                        worksheet.Cell(rowIndex, 2).Value = item.Answer1?.ToString() ?? "";
                        worksheet.Cell(rowIndex, 3).Value = item.Answer2?.ToString() ?? "";
                        worksheet.Cell(rowIndex, 4).Value = item.Answer3?.ToString() ?? "";
                        worksheet.Cell(rowIndex, 5).Value = item.Answer4?.ToString() ?? "";
                        worksheet.Cell(rowIndex, 6).Value = item.Correct?.ToString() ?? "";

                        rowIndex++;
                    }

                    worksheet.Columns().AdjustToContents(); // Canh chỉnh cột

                    using (var stream = new MemoryStream())
                    {
                        workbook.SaveAs(stream);
                        return stream.ToArray();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception($"Lỗi khi xuất Excel: {ex.Message}");
            }
        }

        private string ExtractImageFromBase64(string htmlContent)
        {
            try
            {
                var match = Regex.Match(htmlContent, "data:image/(?<type>.*?);base64,(?<data>.+?)\"");
                if (!match.Success) return null;

                var imageData = match.Groups["data"].Value;
                var imageBytes = Convert.FromBase64String(imageData);
                var extension = match.Groups["type"].Value.Split(';')[0];
                var fileName = $"image_{Guid.NewGuid()}.{extension}";

                var filePath = Path.Combine(Path.GetTempPath(), fileName);
                File.WriteAllBytes(filePath, imageBytes);

                return filePath;
            }
            catch
            {
                return null;
            }
        }

        // Loại bỏ phần base64 trong text (nếu có)
        private string RemoveBase64FromText(string text)
        {
            return Regex.Replace(text, "<img.*?>", "").Trim();
        }

    }
}
