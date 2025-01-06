using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class XcaccountDocument
    {
        public string AccountId { get; set; } = null!;
        public string DocumentId { get; set; } = null!;
        public string? DocumentStatus { get; set; }
        public string? DocumentFilename { get; set; }
        public DateTime? DocumentRenewDate { get; set; }
        public string? RenewFlag { get; set; }
        public string State { get; set; } = null!;
    }
}
