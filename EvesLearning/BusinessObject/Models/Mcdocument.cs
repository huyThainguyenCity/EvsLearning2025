using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Mcdocument
    {
        public string DocumentId { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string? NameEx { get; set; }
        public string ApplyAllCourses { get; set; } = null!;
        public string? CourseId { get; set; }
        public string? Filename { get; set; }
        public string? Remark { get; set; }
        public string? RenewFlag { get; set; }
        public string? DocumentRenewDateType { get; set; }
        public int? RenewPeriod { get; set; }
        public int? SendExpiryNotifyBeforeDay { get; set; }
        public string? State { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string? CheckedBy { get; set; }
        public DateTime? CheckedOn { get; set; }
    }
}
