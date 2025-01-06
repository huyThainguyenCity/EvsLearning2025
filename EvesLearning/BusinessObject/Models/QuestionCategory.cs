using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class QuestionCategory
    {
        public int Id { get; set; }
        public int? ExamId { get; set; }
        /// <summary>
        /// Phân lại chủ thể
        /// </summary>
        public int? QuestionType { get; set; }
        /// <summary>
        /// Chương trình học của tôi
        /// </summary>
        public int? MyProgramId { get; set; }
        public string? Name { get; set; }
        public string? ShortContent { get; set; }
        public string? Contents { get; set; }
        public string? Contents2 { get; set; }
        public int? FullTime { get; set; }
        public string? AudioName { get; set; }
        public string? ImageName { get; set; }
        public int? Viewers { get; set; }
        public int? Type { get; set; }
        /// <summary>
        /// 1: Bai Tap; 2: Cau hoi
        /// </summary>
        public int? Status { get; set; }
        public int? Deleted { get; set; }
        public string? Hint1 { get; set; }
        public string? Hint2 { get; set; }
        public string? Hint3 { get; set; }
        public string? Hint4 { get; set; }
        public string? Hint5 { get; set; }
        public string? Hint6 { get; set; }
        public string? Hint7 { get; set; }
        public string? Hint8 { get; set; }
        public string? Hint9 { get; set; }
        public string? Hint10 { get; set; }
        public string? CreatedBy { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModify { get; set; }
        public int? Language { get; set; }
    }
}
