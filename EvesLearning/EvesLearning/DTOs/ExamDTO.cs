namespace EvesLearning.DTOs
{
    public class ExamDTO
    {
        public int? ID { get;set; }
        public int? ExamCategoryID { get;set; }
        public string? QuestionListID { get;set; }
        public string? Name { get;set; }
        public int? FullTime { get; set; }
        public int? Total { get; set; }
        public int? Deleted { get; set; }
        public Dictionary<int, int> QuestionLevels { get; set; } // Level - Số lượng câu hỏi
        public int ExamCount { get; set; } // Số lượng đề cần tạo
    }
    public class CreateExamDTO : ExamDTO
    {
        public string? CreatedBy { get; set; }
        public DateTime? DateCreated { get; set; }
    }
    public class UpdateExamDTO : ExamDTO
    {
        public string? ModifyBy { get; set; }
        public DateTime? DateModify { get; set; }
    }
}
