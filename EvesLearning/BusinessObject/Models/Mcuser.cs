using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Mcuser
    {
        public string UserId { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string? NameEx { get; set; }
        public string Type { get; set; } = null!;
        public string BranchId { get; set; } = null!;
        public string? DepartmentId { get; set; }
        public string Status { get; set; } = null!;
        public string? Gender { get; set; }
        public string? PhoneNumber { get; set; }
        public string? EmailAddress { get; set; }
        public string? SupervisorUserId { get; set; }
        public string? SupporterUserId { get; set; }
        public string LogonEnableFlag { get; set; } = null!;
        public string? LogonPassword { get; set; }
        public DateTime? LogonPasswordExpiryDate { get; set; }
        public string? LogonMustChangePasswordFlag { get; set; }
        public string? LogonAccountLockedOutFlag { get; set; }
        public short LogonMaximumCount { get; set; }
        public short LogonCount { get; set; }
        public short LogonFailedCount { get; set; }
        public DateTime? LastLogonTime { get; set; }
        public string? LastLogonAddress { get; set; }
        public string? SuperUserFlag { get; set; }
        public string? RebateSchemeId { get; set; }
        public string BlackListFlag { get; set; } = null!;
        public string ReportViewAllDepartmentFlag { get; set; } = null!;
        public decimal? ExposureLimit { get; set; }
        public string? Aeoiid { get; set; }
        public string CompanyAeflag { get; set; } = null!;
        public DateTime? OpenDate { get; set; }
        public DateTime? CloseDate { get; set; }
        public DateTime? HireDate { get; set; }
        public DateTime? ContractDate { get; set; }
        public string? Remark { get; set; }
        public string? RemarkEx { get; set; }
        public string State { get; set; } = null!;
        public string? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string? CheckedBy { get; set; }
        public DateTime? CheckedOn { get; set; }
    }
}
