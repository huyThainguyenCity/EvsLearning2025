using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class ExamLog
    {
        public int Id { get; set; }
        public string? LogEvent { get; set; }
        public int? ExamId { get; set; }
        public string? UserName { get; set; }
        public int? QuestionCategoryId { get; set; }
        public int? QuestionId { get; set; }
        public string? UserChoice { get; set; }
        public string? Correct { get; set; }
        public int? Score { get; set; }
        public string? TotalScore { get; set; }
        public double? Percents { get; set; }
        public string? Description { get; set; }
        public int? Deleted { get; set; }
        public DateTime? DateCreated { get; set; }
        public string? Ipaddress { get; set; }
        public int? Language { get; set; }
    }
}
