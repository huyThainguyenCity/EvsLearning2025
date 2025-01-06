namespace EvesLearning.DTOs
{
    public class QuestionTypeDTO
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? Reference { get; set; }
        public int? Status { get; set; }
        public int? Deleted { get; set; }
        public string? CreatedBy { get; set; }
        public int? Index { get; set; }
        public DateTime? DateCreated { get; set; }
        public int? Language { get; set; }
    }
}
