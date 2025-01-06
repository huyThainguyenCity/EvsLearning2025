using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class McuserPasswordHistory
    {
        public string UserId { get; set; } = null!;
        public string LogonPassword { get; set; } = null!;
        public DateTime CreatedOn { get; set; }
    }
}
