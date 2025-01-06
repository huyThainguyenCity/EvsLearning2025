using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class McuserParameter
    {
        public string UserId { get; set; } = null!;
        public string ParameterId { get; set; } = null!;
        public string? ParameterValue { get; set; }
        public string State { get; set; } = null!;
        public string? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string? CheckedBy { get; set; }
        public DateTime? CheckedOn { get; set; }
    }
}
