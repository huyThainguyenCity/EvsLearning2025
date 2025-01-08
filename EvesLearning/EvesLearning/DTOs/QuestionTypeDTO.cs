﻿namespace EvesLearning.DTOs
{
    public class QuestionTypeDTO
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? Reference { get; set; }
        public int? Status { get; set; }
        public int? Deleted { get; set; }
        public int? Index { get; set; }
        public int? Language { get; set; }
    }
    public class CreateQuestionTypeDTO : QuestionTypeDTO
    {
        public string? CreatedBy { get; set; }
        public DateTime? DateCreated { get; set; }
    }
    public class UpdateQuestionTypeDTO : QuestionTypeDTO
    {
        public int? Id { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateModify { get; set; }
    }
}
