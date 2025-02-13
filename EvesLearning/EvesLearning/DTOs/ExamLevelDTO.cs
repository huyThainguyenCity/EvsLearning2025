namespace EvesLearning.DTOs
{
	public class ExamLevelDTO
	{
		public string? Name { get; set; }
		public int? Deleted { get; set; }
	}

	public class CreateExamLevelDTO : ExamLevelDTO
	{
		public string? CreatedBy { get; set; }
		public DateTime? DateCreated { get; set; }
	}
	public class UpdateExamLevelDTO : ExamLevelDTO
	{
		public string? ModifyBy { get; set; }
		public DateTime? DateModify { get; set; }
	}
}
