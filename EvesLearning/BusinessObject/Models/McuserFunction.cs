using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class McuserFunction
    {
        public string FunctionId { get; set; } = null!;
        public string? UserId { get; set; }
        public string? CanQueryFlag { get; set; }
        public string? CanAddFlag { get; set; }
        public string? CanUpdateFlag { get; set; }
        public string? CanDeleteFlag { get; set; }
        public string? CanExecuteFlag { get; set; }
        public string? CanCheckAddFlag { get; set; }
        public string? CanCheckUpdateFlag { get; set; }
        public string? CanCheckDeleteFlag { get; set; }
        public string? CanCheckExecuteFlag { get; set; }
        public string? CanImportFlag { get; set; }
        public string? CanExportFlag { get; set; }
        public string? CanPrintFlag { get; set; }
        public string? CanCopyRecordFlag { get; set; }
        public string? NeedNotificationFlag { get; set; }
        public string? NeedCheckAccessHierarchyFlag { get; set; }
        public string? State { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string? CheckedBy { get; set; }
        public DateTime? CheckedOn { get; set; }
    }
}
