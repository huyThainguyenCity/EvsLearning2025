using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Question
    {
        public int Id { get; set; }
        public int? QuestionCategoryId { get; set; }
        public int? ParentId { get; set; }
        public int? QuestionLevelId { get; set; }
        public int? LectureId { get; set; }
        public string? Name { get; set; }
        public string? ShortContent { get; set; }
        public string? Contents { get; set; }
        public string? Contents2 { get; set; }
        public string? Answer1 { get; set; }
        public string? Answer2 { get; set; }
        public string? Answer3 { get; set; }
        public string? Answer4 { get; set; }
        public string? Answer5 { get; set; }
        public string? Answer6 { get; set; }
        public string? Answer7 { get; set; }
        public string? Answer8 { get; set; }
        public string? Answer9 { get; set; }
        public string? Answer10 { get; set; }
        public string? Correct { get; set; }
        public string? Comment0 { get; set; }
        public string? Comment1 { get; set; }
        public string? Comment2 { get; set; }
        public string? Comment3 { get; set; }
        public string? Comment4 { get; set; }
        public string? Comment5 { get; set; }
        public string? Comment6 { get; set; }
        public string? Comment7 { get; set; }
        public string? Comment8 { get; set; }
        public string? Comment9 { get; set; }
        public string? Comment10 { get; set; }
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
        public int? Theme { get; set; }
        public string? ImageName { get; set; }
        public string? ImagePath { get; set; }
        public string? AudioName { get; set; }
        public string? AudioPath { get; set; }
        public string? DocsName { get; set; }
        public string? DocsPath { get; set; }
        public int? Viewers { get; set; }
        /// <summary>
        /// 1:Cau hoi, 2: Bai Tap, -1 Bai giang
        /// </summary>
        public int? Status { get; set; }
        public string? Keyword { get; set; }
        public int? Type { get; set; }
        public int? Deleted { get; set; }
        public string? CreatedBy { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModify { get; set; }
        public int? Language { get; set; }
    }
}
