namespace EvesLearning.DTOs
{
    public class QuestionDTO
    {
        public int? Id { get; set; }
        public string? Name { get; set; }
        public string? Answer1 { get; set; }
        public string? Answer2 { get; set; }
        public string? Answer3 { get; set; }
        public string? Answer4 { get; set; }
        public string? Correct { get; set; }
        public int? QuestionCategoryID { get; set; }
        public int? QuestionLevelID { get; set; }
    }

    public class CreateQuestionDTO : QuestionDTO
    {
        public string? CreatedBy { get; set; }
        public DateTime? DateCreated { get; set; }
    }
    public class UpdateQuestionDTO : QuestionDTO
    {
        public string? ModifyBy { get; set; }
        public DateTime? DateModify { get; set; }
    }
    public class UserAnswerDTO
    {
        public int QuestionId { get; set; } // ID của câu hỏi
        public string? SelectedAnswer { get; set; } // Đáp án mà người dùng đã chọn (1, 2, 3, 4)
    }
    public class AnswerResultDTO
    {
        public int QuestionId { get; set; } // ID của câu hỏi
        public bool IsCorrect { get; set; } // true nếu đáp án đúng, false nếu sai
        public string? CorrectAnswer { get; set; } // Đáp án đúng của câu hỏi
    }
}
