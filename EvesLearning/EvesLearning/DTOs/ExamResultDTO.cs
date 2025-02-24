namespace EvesLearning.DTOs
{
	public class ExamResultDTO
	{
		public int? ID { get; set; }
		public int? ExamID { get; set; }
		public int? QuestionCategoryID { get; set; }
		public int? QuestionID { get; set; }
		public string? UserChoice { get; set; }
		public string? Correct { get; set; }
		public int? Deleted { get; set; }
		public int? Score { get; set; }
		public int? TotalScore { get; set; }
	}

	public class CreateExamResultDTO : ExamResultDTO
	{
		public string? CreatedBy { get; set; }
		public DateTime? DateCreated { get; set; }
	}
}
