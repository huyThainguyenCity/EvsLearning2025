namespace EvesLearning.DTOs
{
    public class QuestionGrammarDTO
    {
        public int? Type { get; set; }
        public string? Name { get; set; }
        public string? ShortContent { get; set; }
        public string? Content { get; set; }
        public int? Viewer { get; set; }
        public string? Image { get; set; }
        public int? Status { get; set; }
        public int? Deleted { get; set; }
        public int? Index { get; set; }
        public int? Language { get; set; }
    }
    public class CreateQuestionGrammarDTO : QuestionGrammarDTO
    {
        public string? CreatedBy { get; set; }
        public DateTime? DateCreated { get; set; }
    }
    public class UpdateQuestionGrammarDTO : QuestionGrammarDTO
    {
        public int? Id { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateModify { get; set; }
    }
}
