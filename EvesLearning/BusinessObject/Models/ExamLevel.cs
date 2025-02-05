using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class ExamLevel
    {
        public int Id { get; set; }
        public int? Type { get; set; }
        public string? Name { get; set; }
        public int? Status { get; set; }
        public int? Deleted { get; set; }
        public int? Language { get; set; }
        public string? CreatedBy { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModify { get; set; }
    }
}
