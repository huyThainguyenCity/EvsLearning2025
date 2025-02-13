namespace EvesLearning.DTOs
{
	public class ExamCategoriesDTO
	{
		public string? CategoryName { get; set; }
		public string? Description { get; set; }
		public int? Deleted { get; set; }
	}
	public class CreateExamCategoriesDTO : ExamCategoriesDTO
	{
		public string? CreatedBy { get; set; }
		public DateTime? DateCreated { get; set; }
	}
	public class UpdateExamCategoriesDTO : ExamCategoriesDTO
	{
		public int? ID { get; set; }
		public string? ModifyBy { get; set; }
		public DateTime? DateModify { get; set; }
	}
}
