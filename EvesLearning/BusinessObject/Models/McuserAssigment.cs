using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class McuserAssigment
    {
        public int Id { get; set; }
        public string UserId { get; set; } = null!;
        public string CourseId { get; set; } = null!;
        public string? RebateSchemeId { get; set; }
        public string? PayableLedgerId { get; set; }
        public string? State { get; set; }
        public DateTime? Deadline { get; set; }
        public string? Descriptions { get; set; }
        public string? AttachedFile { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string? CheckedBy { get; set; }
        public DateTime? CheckedOn { get; set; }
    }
}
