namespace EvesLearning.DTOs
{
    public class QuestionCategoriesDTO
    {
        public string? Name { get; set; }
        public string? ShortContent { get; set; }
        public string? Contents { get; set; }
        public string? Contents2 { get; set; }
        public int? Deleted { get; set; }
    }
    public class CreateQuestionCategoriesDTO : QuestionCategoriesDTO
    {
        public string? CreatedBy { get; set; }
        public DateTime? DateCreated { get; set; }
    }
    public class UpdateQuestionCategoriesDTO : QuestionCategoriesDTO
    {
        public int? ID { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateModify { get; set; }
    }
}
