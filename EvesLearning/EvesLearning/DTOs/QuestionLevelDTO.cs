namespace EvesLearning.DTOs
{
    public class QuestionLevelDTO
    {
        public string? Name { get; set; }
        public int? Status { get; set; }
        public int? Index { get; set; }
        public int? Deleted { get; set; }
        public int? Language { get; set; }
    }
    public class CreateQuestionLevelDTO : QuestionLevelDTO
    {
        public string? CreatedBy { get; set; }
        public DateTime? DateCreated { get; set; }
    }
    public class UpdateQuestionLevelDTO : QuestionLevelDTO
    {
        public int? Id { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateModify { get; set; }
    }
}
