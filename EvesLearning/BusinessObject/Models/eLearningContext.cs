using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace BusinessObject.Models
{
    public partial class eLearningContext : DbContext
    {
        public eLearningContext()
        {
        }

        public eLearningContext(DbContextOptions<eLearningContext> options)
            : base(options)
        {
        }

        public virtual DbSet<McaccountDocument> McaccountDocuments { get; set; } = null!;
        public virtual DbSet<McaccountTypeDocument> McaccountTypeDocuments { get; set; } = null!;
        public virtual DbSet<Mcdocument> Mcdocuments { get; set; } = null!;
        public virtual DbSet<Mcemp> Mcemps { get; set; } = null!;
        public virtual DbSet<Mcuser> Mcusers { get; set; } = null!;
        public virtual DbSet<McuserAccessibleBranch> McuserAccessibleBranches { get; set; } = null!;
        public virtual DbSet<McuserApprovalLimit> McuserApprovalLimits { get; set; } = null!;
        public virtual DbSet<McuserAssigment> McuserAssigments { get; set; } = null!;
        public virtual DbSet<McuserCompany> McuserCompanies { get; set; } = null!;
        public virtual DbSet<McuserFunction> McuserFunctions { get; set; } = null!;
        public virtual DbSet<McuserGroup> McuserGroups { get; set; } = null!;
        public virtual DbSet<McuserParameter> McuserParameters { get; set; } = null!;
        public virtual DbSet<McuserPasswordHistory> McuserPasswordHistories { get; set; } = null!;
        public virtual DbSet<McuserRole> McuserRoles { get; set; } = null!;
        public virtual DbSet<Question> Questions { get; set; } = null!;
        public virtual DbSet<QuestionAnswer> QuestionAnswers { get; set; } = null!;
        public virtual DbSet<QuestionCategory> QuestionCategories { get; set; } = null!;
        public virtual DbSet<QuestionGrammar> QuestionGrammars { get; set; } = null!;
        public virtual DbSet<QuestionGroup> QuestionGroups { get; set; } = null!;
        public virtual DbSet<QuestionLevel> QuestionLevels { get; set; } = null!;
        public virtual DbSet<QuestionType> QuestionTypes { get; set; } = null!;
        public virtual DbSet<XcaccountDocument> XcaccountDocuments { get; set; } = null!;
        public virtual DbSet<XcexpandedUserAccessibleBranch> XcexpandedUserAccessibleBranches { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=10.10.168.45;Database=eLearning;User Id=huydq;Password=Huy@2001;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<McaccountDocument>(entity =>
            {
                entity.HasKey(e => e.UserId);

                entity.ToTable("MCAccountDocument");

                entity.Property(e => e.UserId)
                    .HasMaxLength(150)
                    .HasColumnName("UserID");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DocumentFilename).HasMaxLength(255);

                entity.Property(e => e.DocumentId)
                    .HasMaxLength(10)
                    .HasColumnName("DocumentID");

                entity.Property(e => e.DocumentRenewDate).HasColumnType("date");

                entity.Property(e => e.DocumentStatus).HasMaxLength(1);

                entity.Property(e => e.RenewFlag)
                    .HasMaxLength(1)
                    .HasDefaultValueSql("('N')");

                entity.Property(e => e.SignUpDate).HasColumnType("date");

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<McaccountTypeDocument>(entity =>
            {
                entity.HasKey(e => new { e.AccountTypeId, e.DocumentId, e.State })
                    .HasName("MCAccountTypeDocument_PK");

                entity.ToTable("MCAccountTypeDocument");

                entity.Property(e => e.AccountTypeId)
                    .HasMaxLength(1)
                    .HasColumnName("AccountTypeID");

                entity.Property(e => e.DocumentId)
                    .HasMaxLength(10)
                    .HasColumnName("DocumentID");

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DocumentFilename).HasMaxLength(255);

                entity.Property(e => e.DocumentStatus).HasMaxLength(1);

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<Mcdocument>(entity =>
            {
                entity.HasKey(e => e.DocumentId);

                entity.ToTable("MCDocument");

                entity.Property(e => e.DocumentId)
                    .HasMaxLength(10)
                    .HasColumnName("DocumentID");

                entity.Property(e => e.ApplyAllCourses)
                    .HasMaxLength(1)
                    .HasDefaultValueSql("('N')");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CourseId)
                    .HasMaxLength(10)
                    .HasColumnName("CourseID");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DocumentRenewDateType).HasMaxLength(1);

                entity.Property(e => e.Filename).HasMaxLength(255);

                entity.Property(e => e.Name).HasMaxLength(60);

                entity.Property(e => e.NameEx).HasMaxLength(60);

                entity.Property(e => e.Remark).HasMaxLength(255);

                entity.Property(e => e.RenewFlag)
                    .HasMaxLength(1)
                    .HasDefaultValueSql("('N')");

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<Mcemp>(entity =>
            {
                entity.HasKey(e => e.UserId);

                entity.ToTable("MCEmp");

                entity.Property(e => e.UserId)
                    .HasMaxLength(150)
                    .HasColumnName("UserID")
                    .HasComment("theo format email");

                entity.Property(e => e.Aeoiid)
                    .HasMaxLength(15)
                    .HasColumnName("AEOIID");

                entity.Property(e => e.BlackListFlag).HasMaxLength(1);

                entity.Property(e => e.BranchId)
                    .HasMaxLength(15)
                    .HasColumnName("BranchID");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CloseDate).HasColumnType("date");

                entity.Property(e => e.CompanyAeflag)
                    .HasMaxLength(1)
                    .HasColumnName("CompanyAEFlag");

                entity.Property(e => e.ContractDate).HasColumnType("date");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DepartmentId)
                    .HasMaxLength(20)
                    .HasColumnName("DepartmentID");

                entity.Property(e => e.EmailAddress)
                    .HasMaxLength(100)
                    .HasColumnName("EMailAddress");

                entity.Property(e => e.ExposureLimit).HasColumnType("decimal(20, 2)");

                entity.Property(e => e.Gender).HasMaxLength(1);

                entity.Property(e => e.HireDate).HasColumnType("date");

                entity.Property(e => e.LastLogonAddress).HasMaxLength(255);

                entity.Property(e => e.LastLogonTime).HasColumnType("datetime");

                entity.Property(e => e.LogonAccountLockedOutFlag).HasMaxLength(1);

                entity.Property(e => e.LogonEnableFlag).HasMaxLength(1);

                entity.Property(e => e.LogonMustChangePasswordFlag).HasMaxLength(1);

                entity.Property(e => e.LogonPassword).HasMaxLength(512);

                entity.Property(e => e.LogonPasswordExpiryDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(60);

                entity.Property(e => e.NameEx).HasMaxLength(60);

                entity.Property(e => e.OpenDate).HasColumnType("date");

                entity.Property(e => e.PhoneNumber).HasMaxLength(30);

                entity.Property(e => e.RebateSchemeId)
                    .HasMaxLength(10)
                    .HasColumnName("RebateSchemeID");

                entity.Property(e => e.Remark).HasMaxLength(255);

                entity.Property(e => e.RemarkEx).HasMaxLength(255);

                entity.Property(e => e.ReportViewAllDepartmentFlag).HasMaxLength(1);

                entity.Property(e => e.State).HasMaxLength(2);

                entity.Property(e => e.Status)
                    .HasMaxLength(1)
                    .HasComment("A=Active; S=Spending; L=Locked; C=Closed");

                entity.Property(e => e.SuperUserFlag).HasMaxLength(1);

                entity.Property(e => e.SupervisorUserId)
                    .HasMaxLength(15)
                    .HasColumnName("SupervisorUserID")
                    .HasComment("Cấp cha");

                entity.Property(e => e.SupporterUserId)
                    .HasMaxLength(15)
                    .HasColumnName("SupporterUserID");

                entity.Property(e => e.Type)
                    .HasMaxLength(1)
                    .HasColumnName("TYPE");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<Mcuser>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.State })
                    .HasName("MCUser_PK");

                entity.ToTable("MCUser");

                entity.Property(e => e.UserId)
                    .HasMaxLength(150)
                    .HasColumnName("UserID");

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.Aeoiid)
                    .HasMaxLength(15)
                    .HasColumnName("AEOIID");

                entity.Property(e => e.BlackListFlag)
                    .HasMaxLength(1)
                    .HasDefaultValueSql("('N')");

                entity.Property(e => e.BranchId)
                    .HasMaxLength(15)
                    .HasColumnName("BranchID");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CloseDate).HasColumnType("date");

                entity.Property(e => e.CompanyAeflag)
                    .HasMaxLength(1)
                    .HasColumnName("CompanyAEFlag")
                    .HasDefaultValueSql("('N')");

                entity.Property(e => e.ContractDate).HasColumnType("date");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DepartmentId)
                    .HasMaxLength(20)
                    .HasColumnName("DepartmentID");

                entity.Property(e => e.EmailAddress)
                    .HasMaxLength(100)
                    .HasColumnName("EMailAddress");

                entity.Property(e => e.ExposureLimit).HasColumnType("decimal(20, 2)");

                entity.Property(e => e.Gender).HasMaxLength(1);

                entity.Property(e => e.HireDate).HasColumnType("date");

                entity.Property(e => e.LastLogonAddress).HasMaxLength(255);

                entity.Property(e => e.LastLogonTime).HasColumnType("datetime");

                entity.Property(e => e.LogonAccountLockedOutFlag).HasMaxLength(1);

                entity.Property(e => e.LogonEnableFlag)
                    .HasMaxLength(1)
                    .HasDefaultValueSql("('N')");

                entity.Property(e => e.LogonMaximumCount).HasDefaultValueSql("((1))");

                entity.Property(e => e.LogonMustChangePasswordFlag).HasMaxLength(1);

                entity.Property(e => e.LogonPassword).HasMaxLength(512);

                entity.Property(e => e.LogonPasswordExpiryDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(60);

                entity.Property(e => e.NameEx).HasMaxLength(60);

                entity.Property(e => e.OpenDate).HasColumnType("date");

                entity.Property(e => e.PhoneNumber).HasMaxLength(30);

                entity.Property(e => e.RebateSchemeId)
                    .HasMaxLength(10)
                    .HasColumnName("RebateSchemeID");

                entity.Property(e => e.Remark).HasMaxLength(255);

                entity.Property(e => e.RemarkEx).HasMaxLength(255);

                entity.Property(e => e.ReportViewAllDepartmentFlag)
                    .HasMaxLength(1)
                    .HasDefaultValueSql("('N')");

                entity.Property(e => e.Status)
                    .HasMaxLength(1)
                    .HasDefaultValueSql("('N')");

                entity.Property(e => e.SuperUserFlag).HasMaxLength(1);

                entity.Property(e => e.SupervisorUserId)
                    .HasMaxLength(15)
                    .HasColumnName("SupervisorUserID");

                entity.Property(e => e.SupporterUserId)
                    .HasMaxLength(15)
                    .HasColumnName("SupporterUserID");

                entity.Property(e => e.Type)
                    .HasMaxLength(1)
                    .HasColumnName("TYPE")
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<McuserAccessibleBranch>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.BranchId, e.State })
                    .HasName("MCUserAccessibleBranch_PK");

                entity.ToTable("MCUserAccessibleBranch");

                entity.Property(e => e.UserId)
                    .HasMaxLength(15)
                    .HasColumnName("UserID");

                entity.Property(e => e.BranchId)
                    .HasMaxLength(15)
                    .HasColumnName("BranchID");

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<McuserApprovalLimit>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.ApprovalType, e.State })
                    .HasName("MCUserApprovalLimit_PK");

                entity.ToTable("MCUserApprovalLimit");

                entity.Property(e => e.UserId)
                    .HasMaxLength(15)
                    .HasColumnName("UserID");

                entity.Property(e => e.ApprovalType).HasMaxLength(15);

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.ApprovalLimit).HasMaxLength(255);

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<McuserAssigment>(entity =>
            {
                entity.ToTable("MCUserAssigment");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.AttachedFile).HasMaxLength(500);

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CourseId)
                    .HasMaxLength(10)
                    .HasColumnName("CourseID");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Deadline).HasColumnType("datetime");

                entity.Property(e => e.Descriptions).HasColumnType("ntext");

                entity.Property(e => e.PayableLedgerId)
                    .HasMaxLength(15)
                    .HasColumnName("PayableLedgerID");

                entity.Property(e => e.RebateSchemeId)
                    .HasMaxLength(10)
                    .HasColumnName("RebateSchemeID");

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.Property(e => e.UserId)
                    .HasMaxLength(150)
                    .HasColumnName("UserID");
            });

            modelBuilder.Entity<McuserCompany>(entity =>
            {
                entity.HasKey(e => e.UserId);

                entity.ToTable("MCUserCompany");

                entity.Property(e => e.UserId)
                    .HasMaxLength(150)
                    .HasColumnName("UserID");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CompanyId)
                    .HasMaxLength(10)
                    .HasColumnName("CompanyID");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<McuserFunction>(entity =>
            {
                entity.HasKey(e => e.FunctionId);

                entity.ToTable("MCUserFunction");

                entity.Property(e => e.FunctionId)
                    .HasMaxLength(15)
                    .HasColumnName("FunctionID");

                entity.Property(e => e.CanAddFlag).HasMaxLength(1);

                entity.Property(e => e.CanCheckAddFlag).HasMaxLength(1);

                entity.Property(e => e.CanCheckDeleteFlag).HasMaxLength(1);

                entity.Property(e => e.CanCheckExecuteFlag).HasMaxLength(1);

                entity.Property(e => e.CanCheckUpdateFlag).HasMaxLength(1);

                entity.Property(e => e.CanCopyRecordFlag).HasMaxLength(1);

                entity.Property(e => e.CanDeleteFlag).HasMaxLength(1);

                entity.Property(e => e.CanExecuteFlag).HasMaxLength(1);

                entity.Property(e => e.CanExportFlag).HasMaxLength(1);

                entity.Property(e => e.CanImportFlag).HasMaxLength(1);

                entity.Property(e => e.CanPrintFlag).HasMaxLength(1);

                entity.Property(e => e.CanQueryFlag).HasMaxLength(1);

                entity.Property(e => e.CanUpdateFlag).HasMaxLength(1);

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.NeedCheckAccessHierarchyFlag).HasMaxLength(1);

                entity.Property(e => e.NeedNotificationFlag).HasMaxLength(1);

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.Property(e => e.UserId)
                    .HasMaxLength(150)
                    .HasColumnName("UserID");
            });

            modelBuilder.Entity<McuserGroup>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.UserGroup, e.State })
                    .HasName("MCUserGroup_PK");

                entity.ToTable("MCUserGroup");

                entity.Property(e => e.UserId)
                    .HasMaxLength(15)
                    .HasColumnName("UserID");

                entity.Property(e => e.UserGroup).HasMaxLength(30);

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<McuserParameter>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.ParameterId, e.State })
                    .HasName("MCUserParameter_PK");

                entity.ToTable("MCUserParameter");

                entity.Property(e => e.UserId)
                    .HasMaxLength(15)
                    .HasColumnName("UserID");

                entity.Property(e => e.ParameterId)
                    .HasMaxLength(100)
                    .HasColumnName("ParameterID");

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ParameterValue).HasMaxLength(4000);

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<McuserPasswordHistory>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.CreatedOn })
                    .HasName("MCUserPasswordHistory_PK");

                entity.ToTable("MCUserPasswordHistory");

                entity.Property(e => e.UserId)
                    .HasMaxLength(15)
                    .HasColumnName("UserID");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.LogonPassword).HasMaxLength(512);
            });

            modelBuilder.Entity<McuserRole>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.RoleId, e.State })
                    .HasName("MCUserRole_PK");

                entity.ToTable("MCUserRole");

                entity.Property(e => e.UserId)
                    .HasMaxLength(15)
                    .HasColumnName("UserID");

                entity.Property(e => e.RoleId)
                    .HasMaxLength(10)
                    .HasColumnName("RoleID");

                entity.Property(e => e.State)
                    .HasMaxLength(2)
                    .HasDefaultValueSql("('A')");

                entity.Property(e => e.CheckedBy).HasMaxLength(15);

                entity.Property(e => e.CheckedOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedBy).HasMaxLength(15);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedBy).HasMaxLength(15);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<Question>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Answer1).HasMaxLength(500);

                entity.Property(e => e.Answer10).HasMaxLength(500);

                entity.Property(e => e.Answer2).HasMaxLength(500);

                entity.Property(e => e.Answer3).HasMaxLength(500);

                entity.Property(e => e.Answer4).HasMaxLength(500);

                entity.Property(e => e.Answer5).HasMaxLength(500);

                entity.Property(e => e.Answer6).HasMaxLength(500);

                entity.Property(e => e.Answer7).HasMaxLength(500);

                entity.Property(e => e.Answer8).HasMaxLength(500);

                entity.Property(e => e.Answer9).HasMaxLength(500);

                entity.Property(e => e.AudioName).HasMaxLength(500);

                entity.Property(e => e.AudioPath).HasMaxLength(500);

                entity.Property(e => e.Comment0).HasColumnType("ntext");

                entity.Property(e => e.Comment1).HasColumnType("ntext");

                entity.Property(e => e.Comment10).HasColumnType("ntext");

                entity.Property(e => e.Comment2).HasColumnType("ntext");

                entity.Property(e => e.Comment3).HasColumnType("ntext");

                entity.Property(e => e.Comment4).HasColumnType("ntext");

                entity.Property(e => e.Comment5).HasColumnType("ntext");

                entity.Property(e => e.Comment6).HasColumnType("ntext");

                entity.Property(e => e.Comment7).HasColumnType("ntext");

                entity.Property(e => e.Comment8).HasColumnType("ntext");

                entity.Property(e => e.Comment9).HasColumnType("ntext");

                entity.Property(e => e.Contents).HasColumnType("ntext");

                entity.Property(e => e.Contents2).HasColumnType("ntext");

                entity.Property(e => e.Correct).HasMaxLength(50);

                entity.Property(e => e.CreatedBy).HasMaxLength(500);

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModify).HasColumnType("datetime");

                entity.Property(e => e.Deleted).HasDefaultValueSql("((0))");

                entity.Property(e => e.DocsName).HasMaxLength(500);

                entity.Property(e => e.DocsPath).HasMaxLength(500);

                entity.Property(e => e.Hint1).HasColumnType("ntext");

                entity.Property(e => e.Hint10).HasColumnType("ntext");

                entity.Property(e => e.Hint2).HasColumnType("ntext");

                entity.Property(e => e.Hint3).HasColumnType("ntext");

                entity.Property(e => e.Hint4).HasColumnType("ntext");

                entity.Property(e => e.Hint5).HasColumnType("ntext");

                entity.Property(e => e.Hint6).HasColumnType("ntext");

                entity.Property(e => e.Hint7).HasColumnType("ntext");

                entity.Property(e => e.Hint8).HasColumnType("ntext");

                entity.Property(e => e.Hint9).HasColumnType("ntext");

                entity.Property(e => e.ImageName).HasMaxLength(500);

                entity.Property(e => e.ImagePath).HasMaxLength(500);

                entity.Property(e => e.Keyword).HasMaxLength(2000);

                entity.Property(e => e.LectureId).HasColumnName("LectureID");

                entity.Property(e => e.ModifyBy).HasMaxLength(500);

                entity.Property(e => e.Name).HasColumnType("ntext");

                entity.Property(e => e.ParentId).HasColumnName("ParentID");

                entity.Property(e => e.QuestionCategoryId).HasColumnName("QuestionCategoryID");

                entity.Property(e => e.QuestionLevelId)
                    .HasColumnName("QuestionLevelID")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.ShortContent).HasColumnType("ntext");

                entity.Property(e => e.Status).HasComment("1:Cau hoi, 2: Bai Tap, -1 Bai giang");

                entity.Property(e => e.Theme).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<QuestionAnswer>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AnswerName).HasColumnType("ntext");

                entity.Property(e => e.CreatedBy).HasMaxLength(500);

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModify).HasColumnType("datetime");

                entity.Property(e => e.Language).HasDefaultValueSql("((1))");

                entity.Property(e => e.ModifyBy).HasMaxLength(500);

                entity.Property(e => e.QuestionId).HasColumnName("QuestionID");

                entity.Property(e => e.Type).HasComment("1: Kanji, 2:Điền từ, 3:Nghe hiểu,4: Ngữ pháp, 5:Đọc hiểu (japanese) <=>English");
            });

            modelBuilder.Entity<QuestionCategory>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AudioName).HasMaxLength(500);

                entity.Property(e => e.Contents).HasColumnType("ntext");

                entity.Property(e => e.Contents2).HasColumnType("ntext");

                entity.Property(e => e.CreatedBy).HasMaxLength(500);

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModify).HasColumnType("datetime");

                entity.Property(e => e.Deleted).HasDefaultValueSql("((0))");

                entity.Property(e => e.ExamId).HasColumnName("ExamID");

                entity.Property(e => e.FullTime).HasDefaultValueSql("((0))");

                entity.Property(e => e.Hint1).HasColumnType("ntext");

                entity.Property(e => e.Hint10).HasColumnType("ntext");

                entity.Property(e => e.Hint2).HasColumnType("ntext");

                entity.Property(e => e.Hint3).HasColumnType("ntext");

                entity.Property(e => e.Hint4).HasColumnType("ntext");

                entity.Property(e => e.Hint5).HasColumnType("ntext");

                entity.Property(e => e.Hint6).HasColumnType("ntext");

                entity.Property(e => e.Hint7).HasColumnType("ntext");

                entity.Property(e => e.Hint8).HasColumnType("ntext");

                entity.Property(e => e.Hint9).HasColumnType("ntext");

                entity.Property(e => e.ImageName).HasMaxLength(500);

                entity.Property(e => e.ModifyBy).HasMaxLength(500);

                entity.Property(e => e.MyProgramId)
                    .HasColumnName("MyProgramID")
                    .HasComment("Chương trình học của tôi");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.QuestionType).HasComment("Phân lại chủ thể");

                entity.Property(e => e.ShortContent).HasColumnType("ntext");

                entity.Property(e => e.Status).HasComment("1: Bai Tap; 2: Cau hoi");
            });

            modelBuilder.Entity<QuestionGrammar>(entity =>
            {
                entity.ToTable("QuestionGrammar");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CreatedBy).HasMaxLength(500);

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModify).HasColumnType("datetime");

                entity.Property(e => e.Deleted).HasDefaultValueSql("((0))");

                entity.Property(e => e.Image).HasMaxLength(500);

                entity.Property(e => e.Language).HasDefaultValueSql("((0))");

                entity.Property(e => e.ModifyBy).HasMaxLength(500);

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.ShortContent).HasMaxLength(2000);
            });

            modelBuilder.Entity<QuestionGroup>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CreatedBy).HasMaxLength(500);

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModify).HasColumnType("datetime");

                entity.Property(e => e.Deleted).HasDefaultValueSql("((0))");

                entity.Property(e => e.Description).HasColumnType("ntext");

                entity.Property(e => e.Language).HasDefaultValueSql("((0))");

                entity.Property(e => e.ModifyBy).HasMaxLength(500);

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.Reference).HasColumnType("ntext");
            });

            modelBuilder.Entity<QuestionLevel>(entity =>
            {
                entity.ToTable("QuestionLevel");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CreatedBy).HasMaxLength(500);

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModify).HasColumnType("datetime");

                entity.Property(e => e.ModifyBy).HasMaxLength(500);

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<QuestionType>(entity =>
            {
                entity.ToTable("QuestionType");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CreatedBy).HasMaxLength(500);

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModify).HasColumnType("datetime");

                entity.Property(e => e.Deleted).HasDefaultValueSql("((0))");

                entity.Property(e => e.Description).HasColumnType("ntext");

                entity.Property(e => e.Language).HasDefaultValueSql("((0))");

                entity.Property(e => e.ModifyBy).HasMaxLength(500);

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.Reference).HasColumnType("ntext");
            });

            modelBuilder.Entity<XcaccountDocument>(entity =>
            {
                entity.HasKey(e => new { e.AccountId, e.DocumentId, e.State })
                    .HasName("XCAccountDocument_PK");

                entity.ToTable("XCAccountDocument");

                entity.Property(e => e.AccountId)
                    .HasMaxLength(15)
                    .HasColumnName("AccountID");

                entity.Property(e => e.DocumentId)
                    .HasMaxLength(10)
                    .HasColumnName("DocumentID");

                entity.Property(e => e.State).HasMaxLength(2);

                entity.Property(e => e.DocumentFilename).HasMaxLength(255);

                entity.Property(e => e.DocumentRenewDate).HasColumnType("date");

                entity.Property(e => e.DocumentStatus).HasMaxLength(1);

                entity.Property(e => e.RenewFlag).HasMaxLength(1);
            });

            modelBuilder.Entity<XcexpandedUserAccessibleBranch>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("XCExpandedUserAccessibleBranch");

                entity.Property(e => e.BranchId)
                    .HasMaxLength(15)
                    .HasColumnName("BranchID");

                entity.Property(e => e.UserId)
                    .HasMaxLength(15)
                    .HasColumnName("UserID");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
