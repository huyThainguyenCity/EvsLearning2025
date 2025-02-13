using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class ExamCategory
    {
        public int Id { get; set; }
        public string? CategoryName { get; set; }
        public string? Description { get; set; }
        public byte[]? Image { get; set; }
        public int? Parent { get; set; }
        public int? ExamLevelId { get; set; }
        /// <summary>
        /// Đồ uống, đồ ăn
        /// </summary>
        public int? Status { get; set; }
        public int? Index { get; set; }
        public int? Deleted { get; set; }
        public string? CreatedBy { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModify { get; set; }
        public int? Language { get; set; }
        public string? Alias { get; set; }
    }
}
