using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class QuestionAnswer
    {
        public int Id { get; set; }
        public int? QuestionId { get; set; }
        public string? AnswerName { get; set; }
        public int? Correct { get; set; }
        public int? Status { get; set; }
        /// <summary>
        /// 1: Kanji, 2:Điền từ, 3:Nghe hiểu,4: Ngữ pháp, 5:Đọc hiểu (japanese) &lt;=&gt;English
        /// </summary>
        public int? Type { get; set; }
        public int? Index { get; set; }
        public int? Deleted { get; set; }
        public string? CreatedBy { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModify { get; set; }
        public int? Language { get; set; }
    }
}
