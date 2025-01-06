using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class McaccountDocument
    {
        public string UserId { get; set; } = null!;
        public string DocumentId { get; set; } = null!;
        public string? DocumentStatus { get; set; }
        public string? DocumentFilename { get; set; }
        public DateTime? SignUpDate { get; set; }
        public DateTime? DocumentRenewDate { get; set; }
        public string? RenewFlag { get; set; }
        public string? State { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string? CheckedBy { get; set; }
        public DateTime? CheckedOn { get; set; }
    }
}
