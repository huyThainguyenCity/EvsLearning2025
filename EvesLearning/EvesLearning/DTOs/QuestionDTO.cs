﻿namespace EvesLearning.DTOs
{
    public class QuestionDTO
    {
        public string? ID { get; set; }
        public string? Name { get; set; }
        public string? Answer1 { get; set; }
        public string? Answer2 { get; set; }
        public string? Answer3 { get; set; }
        public string? Answer4 { get; set; }
        public string? Correct { get; set; }
    }

    public class CreateQuestionDTO : QuestionDTO
    {
        public string? CreatedBy { get; set; }
        public DateTime? DateCreated { get; set; }
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
