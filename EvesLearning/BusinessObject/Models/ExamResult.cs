using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class ExamResult
    {
        public int Id { get; set; }
        public string? LogEvent { get; set; }
        public int? ExamId { get; set; }
        public string? UserName { get; set; }
        public int? UserId { get; set; }
        public int? QuestionCategoryId { get; set; }
        public int? QuestionId { get; set; }
        public string? UserChoice { get; set; }
        public string? Correct { get; set; }
        public double? Score { get; set; }
        public double? TotalScore { get; set; }
        public double? Percents { get; set; }
        public string? Description { get; set; }
        public string? Actions { get; set; }
        public double? Total { get; set; }
        public int? ScoreInput { get; set; }
        public int? ScoreOutput { get; set; }
        public int? Status { get; set; }
        public int? Deleted { get; set; }
        public string? CreatedBy { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModify { get; set; }
        public int? Language { get; set; }
        public string? Ipaddress { get; set; }
    }
}
