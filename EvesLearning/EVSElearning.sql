USE [master]
GO
/****** Object:  Database [eLearning]    Script Date: 2/14/2025 4:48:20 PM ******/
CREATE DATABASE [eLearning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eLearning', FILENAME = N'D:\DATABASE\eLearning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eLearning_log', FILENAME = N'D:\DATABASE\eLearning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [eLearning] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eLearning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eLearning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eLearning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eLearning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eLearning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eLearning] SET ARITHABORT OFF 
GO
ALTER DATABASE [eLearning] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eLearning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eLearning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eLearning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eLearning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eLearning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eLearning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eLearning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eLearning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eLearning] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eLearning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eLearning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eLearning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eLearning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eLearning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eLearning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eLearning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eLearning] SET RECOVERY FULL 
GO
ALTER DATABASE [eLearning] SET  MULTI_USER 
GO
ALTER DATABASE [eLearning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eLearning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eLearning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eLearning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eLearning] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eLearning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'eLearning', N'ON'
GO
ALTER DATABASE [eLearning] SET QUERY_STORE = OFF
GO
USE [eLearning]
GO
/****** Object:  User [sa2]    Script Date: 2/14/2025 4:48:20 PM ******/
CREATE USER [sa2] FOR LOGIN [minhnd1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [huydq]    Script Date: 2/14/2025 4:48:20 PM ******/
CREATE USER [huydq] FOR LOGIN [huydq] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [huydq]
GO
/****** Object:  Table [dbo].[ExamCategories]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](500) NULL,
	[Description] [nvarchar](4000) NULL,
	[Image] [image] NULL,
	[Parent] [int] NULL,
	[ExamLevelID] [int] NULL,
	[Status] [int] NULL,
	[Index] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
	[Alias] [nvarchar](500) NULL,
 CONSTRAINT [PK_ExamCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamLevel]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamLevel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[Deleted] [int] NULL,
	[Language] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
 CONSTRAINT [PK_ExamLevel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamLogs]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamLogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogEvent] [nvarchar](50) NULL,
	[ExamID] [int] NULL,
	[UserName] [nvarchar](500) NULL,
	[QuestionCategoryID] [int] NULL,
	[QuestionID] [int] NULL,
	[UserChoice] [nvarchar](50) NULL,
	[Correct] [nvarchar](50) NULL,
	[Score] [int] NULL,
	[TotalScore] [nvarchar](50) NULL,
	[Percents] [float] NULL,
	[Description] [ntext] NULL,
	[Deleted] [int] NULL,
	[DateCreated] [datetime] NULL,
	[IPAddress] [nvarchar](500) NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_ExamLogs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamResultPass]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamResultPass](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogEvent] [nvarchar](50) NULL,
	[ExamID] [int] NULL,
	[UserName] [nvarchar](500) NULL,
	[UserID] [int] NULL,
	[QuestionCategoryID] [int] NULL,
	[QuestionID] [int] NULL,
	[UserChoice] [nvarchar](50) NULL,
	[Correct] [nvarchar](50) NULL,
	[Score] [float] NULL,
	[TotalScore] [float] NULL,
	[Percents] [float] NULL,
	[Description] [ntext] NULL,
	[Actions] [ntext] NULL,
	[Total] [float] NULL,
	[ScoreInput] [int] NULL,
	[ScoreOutput] [int] NULL,
	[Status] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_ExamResultPass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamResults]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogEvent] [nvarchar](50) NULL,
	[ExamID] [int] NULL,
	[UserName] [nvarchar](500) NULL,
	[UserID] [int] NULL,
	[QuestionCategoryID] [int] NULL,
	[QuestionID] [int] NULL,
	[UserChoice] [nvarchar](50) NULL,
	[Correct] [nvarchar](50) NULL,
	[Score] [float] NULL,
	[TotalScore] [float] NULL,
	[Percents] [float] NULL,
	[Description] [ntext] NULL,
	[Actions] [ntext] NULL,
	[Total] [float] NULL,
	[ScoreInput] [int] NULL,
	[ScoreOutput] [int] NULL,
	[Status] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
	[IPAddress] [nvarchar](500) NULL,
 CONSTRAINT [PK_ExamResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExamCategoryID] [int] NULL,
	[ExamLevelID] [int] NULL,
	[ProgramID] [int] NULL,
	[MyProgramID] [int] NULL,
	[QuestionListID] [nvarchar](4000) NULL,
	[Name] [nvarchar](500) NULL,
	[ShortContent] [ntext] NULL,
	[Content] [ntext] NULL,
	[FullTime] [int] NULL,
	[Progress] [float] NULL,
	[QuestionCurrent] [float] NULL,
	[Total] [float] NULL,
	[PromotionalID] [nvarchar](50) NULL,
	[Descriptions] [nvarchar](4000) NULL,
	[Note] [ntext] NULL,
	[Views] [int] NULL,
	[Status] [int] NULL,
	[ImageName] [nvarchar](200) NULL,
	[ImagePath] [nvarchar](500) NULL,
	[Video] [nvarchar](500) NULL,
	[VideoPath] [nvarchar](500) NULL,
	[Audio] [nvarchar](500) NULL,
	[AudioPath] [nvarchar](500) NULL,
	[Type] [int] NULL,
	[Approve] [int] NULL,
	[Deleted] [int] NULL,
	[LastLogin] [datetime] NULL,
	[IPLogin] [nvarchar](50) NULL,
	[BarcodeNew] [nvarchar](500) NULL,
	[BarcodeOld] [nvarchar](500) NULL,
	[BarcodeDate] [datetime] NULL,
	[PageTitle] [nvarchar](2000) NULL,
	[PageKeywords] [nvarchar](2000) NULL,
	[PageDescription] [nvarchar](2000) NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamType]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[FullTime] [int] NULL,
	[Status] [int] NULL,
	[Description] [ntext] NULL,
	[Deleted] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_ExamType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCAccountDocument]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCAccountDocument](
	[UserID] [nvarchar](150) NOT NULL,
	[DocumentID] [nvarchar](10) NOT NULL,
	[DocumentStatus] [nvarchar](1) NULL,
	[DocumentFilename] [nvarchar](255) NULL,
	[SignUpDate] [date] NULL,
	[DocumentRenewDate] [date] NULL,
	[RenewFlag] [nvarchar](1) NULL,
	[State] [nvarchar](2) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [PK_MCAccountDocument] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCAccountTypeDocument]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCAccountTypeDocument](
	[AccountTypeID] [nvarchar](1) NOT NULL,
	[DocumentID] [nvarchar](10) NOT NULL,
	[DocumentStatus] [nvarchar](1) NULL,
	[DocumentFilename] [nvarchar](255) NULL,
	[State] [nvarchar](2) NOT NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [MCAccountTypeDocument_PK] PRIMARY KEY CLUSTERED 
(
	[AccountTypeID] ASC,
	[DocumentID] ASC,
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCDocument]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCDocument](
	[DocumentID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[NameEx] [nvarchar](60) NULL,
	[ApplyAllCourses] [nvarchar](1) NOT NULL,
	[CourseID] [nvarchar](10) NULL,
	[Filename] [nvarchar](255) NULL,
	[Remark] [nvarchar](255) NULL,
	[RenewFlag] [nvarchar](1) NULL,
	[DocumentRenewDateType] [nvarchar](1) NULL,
	[RenewPeriod] [int] NULL,
	[SendExpiryNotifyBeforeDay] [int] NULL,
	[State] [nvarchar](2) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [PK_MCDocument] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCEmp]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCEmp](
	[UserID] [nvarchar](150) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[NameEx] [nvarchar](60) NULL,
	[TYPE] [nvarchar](1) NULL,
	[BranchID] [nvarchar](15) NULL,
	[DepartmentID] [nvarchar](20) NULL,
	[Status] [nvarchar](1) NULL,
	[Gender] [nvarchar](1) NULL,
	[PhoneNumber] [nvarchar](30) NULL,
	[EMailAddress] [nvarchar](100) NULL,
	[SupervisorUserID] [nvarchar](15) NULL,
	[SupporterUserID] [nvarchar](15) NULL,
	[LogonEnableFlag] [nvarchar](1) NULL,
	[LogonPassword] [nvarchar](512) NULL,
	[LogonPasswordExpiryDate] [datetime] NULL,
	[LogonMustChangePasswordFlag] [nvarchar](1) NULL,
	[LogonAccountLockedOutFlag] [nvarchar](1) NULL,
	[LogonMaximumCount] [smallint] NULL,
	[LogonCount] [smallint] NULL,
	[LogonFailedCount] [smallint] NULL,
	[LastLogonTime] [datetime] NULL,
	[LastLogonAddress] [nvarchar](255) NULL,
	[SuperUserFlag] [nvarchar](1) NULL,
	[RebateSchemeID] [nvarchar](10) NULL,
	[BlackListFlag] [nvarchar](1) NULL,
	[ReportViewAllDepartmentFlag] [nvarchar](1) NULL,
	[ExposureLimit] [decimal](20, 2) NULL,
	[AEOIID] [nvarchar](15) NULL,
	[CompanyAEFlag] [nvarchar](1) NOT NULL,
	[OpenDate] [date] NULL,
	[CloseDate] [date] NULL,
	[HireDate] [date] NULL,
	[ContractDate] [date] NULL,
	[Remark] [nvarchar](255) NULL,
	[RemarkEx] [nvarchar](255) NULL,
	[State] [nvarchar](2) NOT NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [PK_MCEmp] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUser]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUser](
	[UserID] [nvarchar](150) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[NameEx] [nvarchar](60) NULL,
	[TYPE] [nvarchar](1) NOT NULL,
	[BranchID] [nvarchar](15) NOT NULL,
	[DepartmentID] [nvarchar](20) NULL,
	[Status] [nvarchar](1) NOT NULL,
	[Gender] [nvarchar](1) NULL,
	[PhoneNumber] [nvarchar](30) NULL,
	[EMailAddress] [nvarchar](100) NULL,
	[SupervisorUserID] [nvarchar](15) NULL,
	[SupporterUserID] [nvarchar](15) NULL,
	[LogonEnableFlag] [nvarchar](1) NOT NULL,
	[LogonPassword] [nvarchar](512) NULL,
	[LogonPasswordExpiryDate] [datetime] NULL,
	[LogonMustChangePasswordFlag] [nvarchar](1) NULL,
	[LogonAccountLockedOutFlag] [nvarchar](1) NULL,
	[LogonMaximumCount] [smallint] NOT NULL,
	[LogonCount] [smallint] NOT NULL,
	[LogonFailedCount] [smallint] NOT NULL,
	[LastLogonTime] [datetime] NULL,
	[LastLogonAddress] [nvarchar](255) NULL,
	[SuperUserFlag] [nvarchar](1) NULL,
	[RebateSchemeID] [nvarchar](10) NULL,
	[BlackListFlag] [nvarchar](1) NOT NULL,
	[ReportViewAllDepartmentFlag] [nvarchar](1) NOT NULL,
	[ExposureLimit] [decimal](20, 2) NULL,
	[AEOIID] [nvarchar](15) NULL,
	[CompanyAEFlag] [nvarchar](1) NOT NULL,
	[OpenDate] [date] NULL,
	[CloseDate] [date] NULL,
	[HireDate] [date] NULL,
	[ContractDate] [date] NULL,
	[Remark] [nvarchar](255) NULL,
	[RemarkEx] [nvarchar](255) NULL,
	[State] [nvarchar](2) NOT NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [MCUser_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUserAccessibleBranch]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUserAccessibleBranch](
	[UserID] [nvarchar](15) NOT NULL,
	[BranchID] [nvarchar](15) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [MCUserAccessibleBranch_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[BranchID] ASC,
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUserApprovalLimit]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUserApprovalLimit](
	[UserID] [nvarchar](15) NOT NULL,
	[ApprovalType] [nvarchar](15) NOT NULL,
	[ApprovalLimit] [nvarchar](255) NULL,
	[State] [nvarchar](2) NOT NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [MCUserApprovalLimit_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ApprovalType] ASC,
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUserAssigment]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUserAssigment](
	[ID] [int] NOT NULL,
	[UserID] [nvarchar](150) NOT NULL,
	[CourseID] [nvarchar](10) NOT NULL,
	[RebateSchemeID] [nvarchar](10) NULL,
	[PayableLedgerID] [nvarchar](15) NULL,
	[State] [nvarchar](2) NULL,
	[Deadline] [datetime] NULL,
	[Descriptions] [ntext] NULL,
	[AttachedFile] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [PK_MCUserAssigment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUserCompany]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUserCompany](
	[UserID] [nvarchar](150) NOT NULL,
	[CompanyID] [nvarchar](10) NULL,
	[State] [nvarchar](2) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [PK_MCUserCompany] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUserFunction]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUserFunction](
	[FunctionID] [nvarchar](15) NOT NULL,
	[UserID] [nvarchar](150) NULL,
	[CanQueryFlag] [nvarchar](1) NULL,
	[CanAddFlag] [nvarchar](1) NULL,
	[CanUpdateFlag] [nvarchar](1) NULL,
	[CanDeleteFlag] [nvarchar](1) NULL,
	[CanExecuteFlag] [nvarchar](1) NULL,
	[CanCheckAddFlag] [nvarchar](1) NULL,
	[CanCheckUpdateFlag] [nvarchar](1) NULL,
	[CanCheckDeleteFlag] [nvarchar](1) NULL,
	[CanCheckExecuteFlag] [nvarchar](1) NULL,
	[CanImportFlag] [nvarchar](1) NULL,
	[CanExportFlag] [nvarchar](1) NULL,
	[CanPrintFlag] [nvarchar](1) NULL,
	[CanCopyRecordFlag] [nvarchar](1) NULL,
	[NeedNotificationFlag] [nvarchar](1) NULL,
	[NeedCheckAccessHierarchyFlag] [nvarchar](1) NULL,
	[State] [nvarchar](2) NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [PK_MCUserFunction] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUserGroup]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUserGroup](
	[UserID] [nvarchar](15) NOT NULL,
	[UserGroup] [nvarchar](30) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [MCUserGroup_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[UserGroup] ASC,
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUserParameter]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUserParameter](
	[UserID] [nvarchar](15) NOT NULL,
	[ParameterID] [nvarchar](100) NOT NULL,
	[ParameterValue] [nvarchar](4000) NULL,
	[State] [nvarchar](2) NOT NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [MCUserParameter_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ParameterID] ASC,
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUserPasswordHistory]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUserPasswordHistory](
	[UserID] [nvarchar](15) NOT NULL,
	[LogonPassword] [nvarchar](512) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [MCUserPasswordHistory_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CreatedOn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCUserRole]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCUserRole](
	[UserID] [nvarchar](15) NOT NULL,
	[RoleID] [nvarchar](10) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[CheckedBy] [nvarchar](15) NULL,
	[CheckedOn] [datetime] NULL,
 CONSTRAINT [MCUserRole_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC,
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionAnswers]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionAnswers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[AnswerName] [ntext] NULL,
	[Correct] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Type] [int] NULL,
	[Index] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionCategories]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExamID] [int] NULL,
	[QuestionType] [int] NULL,
	[MyProgramID] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[ShortContent] [ntext] NULL,
	[Contents] [ntext] NULL,
	[Contents2] [ntext] NULL,
	[FullTime] [int] NULL,
	[AudioName] [nvarchar](500) NULL,
	[ImageName] [nvarchar](500) NULL,
	[Viewers] [int] NULL,
	[Type] [int] NULL,
	[Status] [int] NULL,
	[Deleted] [int] NULL,
	[Hint1] [ntext] NULL,
	[Hint2] [ntext] NULL,
	[Hint3] [ntext] NULL,
	[Hint4] [ntext] NULL,
	[Hint5] [ntext] NULL,
	[Hint6] [ntext] NULL,
	[Hint7] [ntext] NULL,
	[Hint8] [ntext] NULL,
	[Hint9] [ntext] NULL,
	[Hint10] [ntext] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_QuestionCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionGrammar]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionGrammar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[ShortContent] [nvarchar](2000) NULL,
	[Content] [nvarchar](max) NULL,
	[Viewer] [int] NULL,
	[Image] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[Deleted] [int] NULL,
	[Index] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_QuestionGrammar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionGroups]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [ntext] NULL,
	[Reference] [ntext] NULL,
	[Status] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[Index] [int] NULL,
	[DateCreated] [datetime] NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_QuestionGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionLevel]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionLevel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[Index] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_QuestionLevel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionCategoryID] [int] NULL,
	[ParentID] [int] NULL,
	[QuestionLevelID] [int] NULL,
	[LectureID] [int] NULL,
	[Name] [ntext] NULL,
	[ShortContent] [ntext] NULL,
	[Contents] [ntext] NULL,
	[Contents2] [ntext] NULL,
	[Answer1] [nvarchar](500) NULL,
	[Answer2] [nvarchar](500) NULL,
	[Answer3] [nvarchar](500) NULL,
	[Answer4] [nvarchar](500) NULL,
	[Answer5] [nvarchar](500) NULL,
	[Answer6] [nvarchar](500) NULL,
	[Answer7] [nvarchar](500) NULL,
	[Answer8] [nvarchar](500) NULL,
	[Answer9] [nvarchar](500) NULL,
	[Answer10] [nvarchar](500) NULL,
	[Correct] [nvarchar](50) NULL,
	[Comment0] [ntext] NULL,
	[Comment1] [ntext] NULL,
	[Comment2] [ntext] NULL,
	[Comment3] [ntext] NULL,
	[Comment4] [ntext] NULL,
	[Comment5] [ntext] NULL,
	[Comment6] [ntext] NULL,
	[Comment7] [ntext] NULL,
	[Comment8] [ntext] NULL,
	[Comment9] [ntext] NULL,
	[Comment10] [ntext] NULL,
	[Hint1] [ntext] NULL,
	[Hint2] [ntext] NULL,
	[Hint3] [ntext] NULL,
	[Hint4] [ntext] NULL,
	[Hint5] [ntext] NULL,
	[Hint6] [ntext] NULL,
	[Hint7] [ntext] NULL,
	[Hint8] [ntext] NULL,
	[Hint9] [ntext] NULL,
	[Hint10] [ntext] NULL,
	[Theme] [int] NULL,
	[ImageName] [nvarchar](500) NULL,
	[ImagePath] [nvarchar](500) NULL,
	[AudioName] [nvarchar](500) NULL,
	[AudioPath] [nvarchar](500) NULL,
	[DocsName] [nvarchar](500) NULL,
	[DocsPath] [nvarchar](500) NULL,
	[Viewers] [int] NULL,
	[Status] [int] NULL,
	[Keyword] [nvarchar](2000) NULL,
	[Type] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateCreated] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [ntext] NULL,
	[Reference] [ntext] NULL,
	[Status] [int] NULL,
	[Deleted] [int] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[Index] [int] NULL,
	[DateCreated] [datetime] NULL,
	[ModifyBy] [nvarchar](500) NULL,
	[DateModify] [datetime] NULL,
	[Language] [int] NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XCAccountDocument]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XCAccountDocument](
	[AccountID] [nvarchar](15) NOT NULL,
	[DocumentID] [nvarchar](10) NOT NULL,
	[DocumentStatus] [nvarchar](1) NULL,
	[DocumentFilename] [nvarchar](255) NULL,
	[DocumentRenewDate] [date] NULL,
	[RenewFlag] [nvarchar](1) NULL,
	[State] [nvarchar](2) NOT NULL,
 CONSTRAINT [XCAccountDocument_PK] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[DocumentID] ASC,
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XCExpandedUserAccessibleBranch]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XCExpandedUserAccessibleBranch](
	[UserID] [nvarchar](15) NOT NULL,
	[BranchID] [nvarchar](15) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ExamCategories] ON 

INSERT [dbo].[ExamCategories] ([ID], [CategoryName], [Description], [Image], [Parent], [ExamLevelID], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language], [Alias]) VALUES (1, N'english', N'so hard', NULL, NULL, NULL, 1, 1, 0, N'string', NULL, CAST(N'2025-02-13T08:56:17.663' AS DateTime), NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[ExamCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamLevel] ON 

INSERT [dbo].[ExamLevel] ([ID], [Type], [Name], [Status], [Deleted], [Language], [CreatedBy], [ModifyBy], [DateCreated], [DateModify]) VALUES (1, NULL, N'examlevel1', NULL, 0, NULL, N'string', NULL, CAST(N'2025-02-13T08:55:56.650' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ExamLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionAnswers] ON 

INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (1, 10, N'huysua', N'2', NULL, NULL, NULL, NULL, N'string', N'string', CAST(N'2025-01-16T04:25:50.540' AS DateTime), NULL, 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (2, 11, N'<p>string</p>', N'1', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2025-02-04T06:46:43.557' AS DateTime), NULL, 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (3, 12, N'<p>tessttt65</p>', N'1', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-03T14:47:58.560' AS DateTime), NULL, 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (4, 13, N'<p>C&acirc;u hỏi 1</p>', N'4', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-05T15:50:02.423' AS DateTime), NULL, 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (14, 16, N'<p>linhhhh</p>', N'1', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-06T16:16:17.283' AS DateTime), CAST(N'2025-02-07T08:13:17.157' AS DateTime), 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (18, 15, N'Testttt', N'1', NULL, NULL, NULL, NULL, NULL, N'string', CAST(N'2025-02-06T16:36:41.740' AS DateTime), CAST(N'2025-02-06T09:38:59.587' AS DateTime), 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (19, 15, N'Testttt', N'2', NULL, NULL, NULL, NULL, NULL, N'string', CAST(N'2025-02-06T16:39:42.387' AS DateTime), CAST(N'2025-02-06T09:38:59.587' AS DateTime), 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (20, 1, N'<p>Thủ đ&ocirc; VN</p>', N'1', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-06T16:43:59.260' AS DateTime), CAST(N'2025-02-07T02:40:38.180' AS DateTime), 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (22, 16, N'<p>linhhhh</p>', N'2', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-06T16:46:20.927' AS DateTime), CAST(N'2025-02-07T08:13:17.157' AS DateTime), 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (23, 14, N'<p>huytessttt</p>', N'1', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-06T16:46:32.300' AS DateTime), CAST(N'2025-02-06T09:46:00.860' AS DateTime), 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (27, 23, N'Câu hỏi 1', N'1', NULL, NULL, NULL, NULL, N'admin', NULL, CAST(N'2025-02-10T06:24:16.557' AS DateTime), NULL, 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (28, 23, N'Câu hỏi 1', N'2', NULL, NULL, NULL, NULL, N'admin', NULL, CAST(N'2025-02-10T06:24:16.557' AS DateTime), NULL, 1)
INSERT [dbo].[QuestionAnswers] ([ID], [QuestionID], [AnswerName], [Correct], [Status], [Type], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (29, 24, N'Câu hỏi 2', N'3', NULL, NULL, NULL, NULL, N'user01', NULL, CAST(N'2025-02-10T06:24:16.557' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[QuestionAnswers] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionCategories] ON 

INSERT [dbo].[QuestionCategories] ([ID], [ExamID], [QuestionType], [MyProgramID], [Name], [ShortContent], [Contents], [Contents2], [FullTime], [AudioName], [ImageName], [Viewers], [Type], [Status], [Deleted], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (1, NULL, NULL, NULL, N'categories1', N'categories1', N'categories1', N'categories1', 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'string', NULL, CAST(N'2025-02-03T03:05:54.957' AS DateTime), NULL, NULL)
INSERT [dbo].[QuestionCategories] ([ID], [ExamID], [QuestionType], [MyProgramID], [Name], [ShortContent], [Contents], [Contents2], [FullTime], [AudioName], [ImageName], [Viewers], [Type], [Status], [Deleted], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (2, NULL, NULL, NULL, N'string', N'string', N'string', N'string', 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'string', NULL, CAST(N'2025-02-03T03:54:20.267' AS DateTime), NULL, NULL)
INSERT [dbo].[QuestionCategories] ([ID], [ExamID], [QuestionType], [MyProgramID], [Name], [ShortContent], [Contents], [Contents2], [FullTime], [AudioName], [ImageName], [Viewers], [Type], [Status], [Deleted], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (3, NULL, NULL, NULL, N'test3', N'test3', N'test3', N'test3', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-03T11:01:32.607' AS DateTime), CAST(N'2025-02-07T07:28:36.613' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[QuestionCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionGrammar] ON 

INSERT [dbo].[QuestionGrammar] ([ID], [Type], [Name], [ShortContent], [Content], [Viewer], [Image], [Status], [Deleted], [Index], [CreatedBy], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (1, NULL, N'grammarr', N'grammarr', N'grammarr', NULL, NULL, NULL, 0, NULL, N'string', CAST(N'2025-01-06T07:43:06.147' AS DateTime), NULL, CAST(N'2025-01-17T08:43:53.963' AS DateTime), NULL)
INSERT [dbo].[QuestionGrammar] ([ID], [Type], [Name], [ShortContent], [Content], [Viewer], [Image], [Status], [Deleted], [Index], [CreatedBy], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (2, NULL, N'grammar', N'grammar1', N'grammar1', NULL, NULL, NULL, 0, NULL, N'string', CAST(N'2025-01-06T07:43:06.147' AS DateTime), NULL, CAST(N'2025-01-17T08:45:23.310' AS DateTime), NULL)
INSERT [dbo].[QuestionGrammar] ([ID], [Type], [Name], [ShortContent], [Content], [Viewer], [Image], [Status], [Deleted], [Index], [CreatedBy], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (3, 0, N'testgrammarrrrr', N'testgrammarrrrr', N'testgrammarrrrr', 0, N'string', 0, 0, 0, N'string', CAST(N'2025-01-06T08:51:30.530' AS DateTime), N'string', CAST(N'2025-01-06T08:52:12.523' AS DateTime), 0)
INSERT [dbo].[QuestionGrammar] ([ID], [Type], [Name], [ShortContent], [Content], [Viewer], [Image], [Status], [Deleted], [Index], [CreatedBy], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (4, 0, N'test', N'test', N'test', 0, N'string', 0, 0, 0, N'string', CAST(N'2025-01-15T02:58:45.503' AS DateTime), N'string', CAST(N'2025-01-15T03:36:53.743' AS DateTime), 0)
INSERT [dbo].[QuestionGrammar] ([ID], [Type], [Name], [ShortContent], [Content], [Viewer], [Image], [Status], [Deleted], [Index], [CreatedBy], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (5, NULL, N'huyt', N'huyt', N'huyt', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2025-01-15T10:03:06.370' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[QuestionGrammar] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionGroups] ON 

INSERT [dbo].[QuestionGroups] ([ID], [Name], [Description], [Reference], [Status], [Deleted], [CreatedBy], [Index], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (1, N'testGroup', N'testGroup', N'testGroup', NULL, 0, N'string', NULL, CAST(N'2025-01-06T07:26:02.550' AS DateTime), NULL, CAST(N'2025-01-17T08:49:38.250' AS DateTime), NULL)
INSERT [dbo].[QuestionGroups] ([ID], [Name], [Description], [Reference], [Status], [Deleted], [CreatedBy], [Index], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (2, N'testGroup1', N'testGroup1', N'testGroup1', 0, 0, N'string', 0, CAST(N'2025-01-06T07:26:02.550' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[QuestionGroups] ([ID], [Name], [Description], [Reference], [Status], [Deleted], [CreatedBy], [Index], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (3, N'testgroupp', N'testgroupp', N'testgroupp', 0, 0, N'string', 0, CAST(N'2025-01-06T08:50:47.547' AS DateTime), N'string', CAST(N'2025-01-06T08:51:22.803' AS DateTime), 0)
INSERT [dbo].[QuestionGroups] ([ID], [Name], [Description], [Reference], [Status], [Deleted], [CreatedBy], [Index], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (4, N'testtt1', N'testtt1', N'testtt1', NULL, 1, NULL, NULL, CAST(N'2025-01-14T16:47:48.727' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[QuestionGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionLevel] ON 

INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (6, N'level2', NULL, NULL, 0, N'string', NULL, CAST(N'2025-01-07T08:41:02.423' AS DateTime), CAST(N'2025-01-17T08:54:19.197' AS DateTime), NULL)
INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (7, N'level4', 0, 0, 0, N'string', NULL, CAST(N'2025-01-07T08:47:21.973' AS DateTime), NULL, 0)
INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (8, N'level5', NULL, NULL, 0, NULL, NULL, CAST(N'2025-01-07T15:53:10.590' AS DateTime), NULL, NULL)
INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (9, N'level6', NULL, NULL, 0, NULL, NULL, CAST(N'2025-01-07T15:53:29.200' AS DateTime), NULL, NULL)
INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (10, N'level7', 0, 0, 0, NULL, NULL, CAST(N'2025-01-07T15:57:49.657' AS DateTime), NULL, NULL)
INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (14, N'level10', NULL, NULL, 0, NULL, NULL, CAST(N'2025-01-07T16:13:34.587' AS DateTime), NULL, NULL)
INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (20, N'level1', 0, 0, 0, NULL, NULL, CAST(N'2025-01-07T16:25:42.633' AS DateTime), NULL, NULL)
INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (21, N'level2', 0, 0, 0, NULL, NULL, CAST(N'2025-01-07T16:37:19.977' AS DateTime), NULL, 0)
INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (22, N'level11', 0, 0, 0, NULL, NULL, CAST(N'2025-01-08T09:29:42.887' AS DateTime), NULL, 0)
INSERT [dbo].[QuestionLevel] ([ID], [Name], [Status], [Index], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (23, N'test', 0, 0, 1, NULL, NULL, CAST(N'2025-01-10T08:55:57.653' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[QuestionLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (1, 1, NULL, 22, NULL, N'<p>Thủ đ&ocirc; VN</p>', NULL, NULL, NULL, N'Hà Nội', N'Thái Nguyên', N'Hải Phòng', N'Sài Gòn', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'string', NULL, CAST(N'2025-01-08T03:10:23.393' AS DateTime), CAST(N'2025-02-07T02:40:38.007' AS DateTime), NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (2, NULL, NULL, 0, NULL, N'Thủ đô TN', NULL, NULL, NULL, N'Hà Nội', N'Thái Nguyên', N'Hải Phòng', N'Sài Gòn', NULL, NULL, NULL, NULL, NULL, NULL, N'2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'string', NULL, CAST(N'2025-01-08T03:10:23.393' AS DateTime), NULL, NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (3, NULL, NULL, 0, NULL, N'Thủ đô Sài Gòn', NULL, NULL, NULL, N'Hà Nội', N'Thái Nguyên', N'Hải Phòng', N'Sài Gòn', NULL, NULL, NULL, NULL, NULL, NULL, N'4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'string', NULL, CAST(N'2025-01-08T03:10:23.393' AS DateTime), NULL, NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (4, NULL, NULL, 0, NULL, N'Thủ đô Nhật Bản', NULL, NULL, NULL, N'Tokyo', N'Hà Nội', N'Việt Nam', N'Sài Gòn', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'string', NULL, CAST(N'2025-01-08T06:55:09.397' AS DateTime), NULL, NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (5, NULL, NULL, 0, NULL, N'thủ đô Mỹ', NULL, NULL, NULL, N'tokyo', N'hà nội', N'newyork', N'sài gòn', NULL, NULL, NULL, NULL, NULL, NULL, N'3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'string', NULL, CAST(N'2025-01-09T07:27:17.090' AS DateTime), NULL, NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (6, NULL, NULL, 0, NULL, N'Thủ đô Anh', NULL, NULL, NULL, N'Luân Đôn', N'Sài Gòn', N'Thái Nguyên', N'Hà Nội', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2025-01-09T14:35:00.120' AS DateTime), NULL, NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (7, NULL, NULL, 0, NULL, N'thủ đô Thái Lan', NULL, NULL, NULL, N'bankok', N'test', N'VN', N'test', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2025-01-09T14:41:55.430' AS DateTime), NULL, NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (8, NULL, NULL, 0, NULL, N'<p><img src="data:image/png;base64,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mgKVY4l2KsPSFKgcS7RTGZamoLblmE3mpiSEq/CLRFbzJPtJMFQXSz0K+7FElWpbmL0Vq6bdQaTpCDno62C276YcL7bkAvlFXpSU+vrgDQXn5/v4/q3Wcri8onBnEftqV4vdhAdfqxaTcGFZsssUm+jwHTNGoICpHEuksBypDEu0Y1lSOZZoxnKkMizRjmVJ5ViiGcuRyrBEO5alMJTjNs1MIRWJCi1TPUH37VtBdbFEAstQGOrg0Nl1tnnwfZ5ZFfOs8nP3s4ryLyJNimf+avbWKyIiIiIiIiIiIruyxDigT4da54iINIjt+V5kbtUlbhERER3FiYiIiIiIiIiI7OLYP2rX1rpUKNGnRYrHDCIiIrs6HcmJiIiIiIiIiIjs4rq19iAx3n4hEmUyWnmQmqjAr4iI7NoU9BUREREREREREdmFdVHATJoA3rigciwiIrsyBX1FRERERERERER2QbExQM92HqSraVxpAthEeY+2Ks8iIrLrUtBXRERERERERERkF9My1YPe7WKQkqAAmTQtzFzv1NKD+Fh7hIiIyC7CM391mdd+LiIiIiIiIiIiIk0U++xtnuRBq1QPEuLskSJN2LY8L7ILgLwiL8p1FVxERJo4BX1FRERERERERESaIDZzmxjnC/amJngQp8xH2YUx8FtUAhSVAtvzvSgrtyeIiIg0EVUGfdOSPUiyDgiTE6whXgeFIiIiIiIiIiIiIiIiIiINpbQMKCjxoqAYKCwBsgt2hHl3CvqyaRf2e5Cs/jxERERERERERERERERERBql/CIvVm/zoqTUL+jbqpkHHdI9iFG8V0RERERERERERERERESkUWO/9eu2exFjvzYB304tFPAVEREREREREREREREREYkGjO12bunxBX3ZpHPHdEV7RURERERERERERERERESijQn6sg9fj2K+IiIiIiIiIiIiIiIiIiJRJyYl0YPkBEV8RURERERERERERERERESiUUxKgv1MRERERERERERERERERESijmd7Xrk3PUWZvtJ4lJcDJWXlKCvzoszrNa/Ly73w2tNFREREREREREREREQCYcQrJsZjDUCsx4PYWA/iY2PMa5GmzFNc6vXGx9qvRBpIaZkXhSXlKC0tR7miuyIiIiIiIiIiIiIiEkYxHiAuLgZJ8TGIi1UypDQ9Hq/Ffi5S75jFm1dUipJSFUMREREREREREREREYm8+DgPUhPjlP0rTYqCvtIgWOryi8pQVFJujxEREREREREREREREak/ifExSEmMhUeJv9IEKOgr9Y4lLqeg1DTpLCIiIiIiIiIiIiIi0lDY1HPzlDjTF7BINFPQV+oV++vNzitRv70iIiIiIiIiIiIiItIoxMb4Ar/s91ckWinoK/WGmb3M8A22xLFN/bjYGFPJxrBtBet/Flf2A1xe7kVJWTms/+sVV8NrfabX+k/tPYiIiIiIiIiIiIhI0+eFx1wSj4GXl8WbaFiJl/zTUuJMAFgkGinoK/WChSyLGb41BGlZmbL9fAZ8g8GM4cLiMmuIXPTXCfSqbQcRERERERERERER2dUxKSrG+s8kRzUxjFGkpaqpZ4lOCvpKvcjJL0VJNX34sgJNSYo1nabXRlm5F3mFZeHtJ9gO9iqhV0RERERERERERERkh6Yc+I23+/iVhsPQpccOzpQX5mP90iWYNu9XlG1fB09hHooLixCX0gzlMbEojW+OE085BSmtWyMpIcG8x/3+XYmCvhJxRSXlJiBbFbaUwAo0HE0m5BeFKetX6b0iIiIiIiIiIiIiItXzAp4YBtns101Eah2S1KRuKgK2JYXI/nMuPAt/xJK1Obh32i8YsUdPDOi/O0rLvchctRIbt25BbIEH+w8ZgpxkD3YftA+69esPxMTukoFfBX0loli4tueWVFnhx1p1ZvOU+LB2js6gL4O/IiIiIiIiIiIiIiISYby+38QiTYwVtmgW3yjSwn7//Xc89dRT2LBhAw466CBcfPHFiI+Pt6c2LeXl5YiJicGKRQvx6UuPY92yJUiIATbnFiO9YwYOPfwIJCQlIz8vB38tWoI//1qEg4YOxoeffmEyDBMSkxCfkoLLrrsZA/fau2J5uwoFfSWiqsu8ZaWZnhregK8jbBm/IiIiIiIiIiIiIiJSNUaZ6ik6WlJSUm8Bz6SEGKQkxtqvGkZeXh7OOussFBYW2mOAc889F2eeeab9qn79nlmOhDhgtw7hD6Q6AdqvvvwC9//rNvTv2AJPfvydVbw8piHx6y46B6NHDEepVd7iYzx48fW3UFZSjDKPB198/wNaNm8GjzUtzutFi9atMf7xJ3DgwYfsUoFfBX0lYtjPblZeqf1qZ2kpcYiLjdwvQbb12UzxFxERERERERERERGRyKmvuO+EB+/B1dfdbL+KPGb7RiJxLZClS5fihx9+QFnZjpZMt2zZgs8//9x+5ZORkYHRo0fbr3w6deqEkSNHIjEx0R4TGQz60h4Z4Q2iMlTJppiX/LUAY085GanxcThs7574dOavWJ1bhpSkRFx9/plo16oFSgqyUZK1GXN++RVbs3OxasN2/Jq5CcmJCWiWmorY2FiUlBQjLT0db7zzHvr1371Bm3pm0Pnhhx/G7NmzMWLECFx11VX2lPCrt6Av776YNGkSxo4dG/FCFy7csRYsWIABAwY0+na/V65ciZ9//hmrV682Kf5t27ZF//79sf/++yPVKuR09913Y9u2bXjggQfM60irLtuWd8fwLplIYrw3i01L269FRERERERERERERCQ6/fH7b7jrzltx67/uwoA9BtljI6u+sn3nzp2L2267zX5VO4wJTZgwwX4VGZEM+pYUl+DoI4/EH7/+jL49uuLoffpgz+5dkBnbGmXlTCIshqcwHzFlBSjathELlizDX2s24bihe2NT+wFIWb8QXZJb44v1W/DBV5+iTVo6+vfbHW9/+BESk5IaLM73008/4dZbb7VfwcToBg4caL8Kr3rJZ2bA91//+hfefPNNvPjii/bYxm/+/PlYuHAhZsyYYQpcY8Rt+9hjj+GSSy4xbbp/8sknpnL47LPPMH78eJxxxhl49dVXzXz8W/g31Zfi0qqbda4q4Lt+/XpccMEF6Nu3L4466ih8//339pTQ8e6bpBArY/Mtr3kJJw/sg5tmmFH1bub1fTD4uJew1n699tUjKr0WkcZv7QeX4swx92Ou/VpERERERERERETq5otPP670WB+qinOE26JFi8zj8OHDTXPOoQ4pKSn466+/zDKiEQOyM2csQmx5OjLaNkOXti1N5nhJszZISYxDt9gy/Ll0FX5ZuhJT5y/DrFVZQHI6hvbqiOZpzbD33oPQvVV7NI8twsDe3VFUUo6s7Fz8Of9XvPzCcw2a2MnMY7dIxhsjHvQtLS3FP//5T8ybN88E8s477zx7SuO3xx57oFWrViZzdvr06Y0u8MtALu8OYKCXmLr/3//+F88//zwef/xx0657s2bNTIb1zTffjOLiYjNffSiz6sHyKurCqu6KKSoqMpngDPTyLocVK1aYyoqdlNdWYnxoRbzhdvtokomP/nEczhxT1XApPlpjz1oJ31fVNJc59+PMCbPtF5X5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r0Q/BX2lwbBp5vyisqCaexYREREREREREREREQkXNueckhhbZTeTItFGQV9pUCx9DPzWX9+8IiIiIiIiIiIiIiKyK2OglwFfBn5FmgoFfaVRKC3zorC4DMVq8llERERERERERERERCIgIc6DpIRYxMUq2itNj4K+0uiwr9/i0nKUlXlRDq/JBlYpFRERERERERERERGRYDCDl0MMPIiN9SAhLsb03SvSlCnoKyIiIiIiIiIiIiIiIiISxdQ7tYiIiIiIiIiIiIiIiIhIFFPQV0REREREREREREREREQkiinoKyIiIiIiIiIiIiIiIiISxRT0FRERERERERERERERERGJYgr6ioiIiIiIiIiIiIiIiIhEMQV9RURERERERERERERERESimIK+IiIiIiIiIiIiIiIiIiJRzLNy9Uqv/VxERERERERERERERERERKKMp7CwUEFfEREREREREREREREREZEopeadRURERERERERERERERESimIK+IiIiIiIiIiIiIiIiIiJRTEFfEREREREREREREREREZEopqCviIiIiIiIiIiIiIiIiEgUU9BXRERERERERERERERERCSKKegrIiIiIiIiIiIiIiIiIhLFFPQVEREREREREREREREREYliCvqKiIiIiIiIiIiIiIiIiEQxT2Fhodd+LiIiItKkzZgxw37WsEaOHGk/ExEREREREREREak7BX1FRERkl8Gg7yGHHGK/ahhff/21gr4iIiIiIiIiIiISVmreWUREREREREREREREREQkiinoKyIiIiIiIiIiIiIiIiISxRT0FRERERERERERERERERGJYgr6yi6FfTlK8JrC9tJ3Hr303Uk4REM5UlmvX9reIiIiIiIiIiLSFHkKCwu99vMmZdGiRcjKyrJfVZaUlIS2bduaITY21h5b/95880289dZb8Hp9X4HH48Hpp5+OM844w7yuT7vKuvBC78iRI+1XUpOmsL30nUfWxo0bsXXrVqSmpqJjx46Ii4uzp9Sdvrvw+eWXX/Drr7/ar0Kz5557Yq+99rJfRR//csTXhxxyiP2qYXz99dc7rZPKev3R9hYRERERERERkaYoYkHfsrIyZGZmokWLFiYYUFUggIG9kpISEzhISUlBq1at7Cl1w6AvA7pt2rSxx+yQn59vghT8LA6JiYn2lMjZtm0b5s+fj59//hl/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q6++wueff24CDgwesdnR448/3gQcavp+w2VX+M5ZtzEwxjqL+wWx/uU2Zp0arhsPpk2bZm4EOf300+0xkRWt391dd91lPwsP9hddV+zfOFBfxsFgGQrnTVBV1fHMUGX9wGMBlmOWN87nj/Ox2Wm2KhAM/3LE14cccoj9amdsUtq/BQzeUME+yJnR6/bLL7+YpusZtHdjaxTu/n/9sYlq/3UKtaxXtX1qwhY8GrK1jMZgV/hdEBERERERERGRXU9Egr4ijZUu9IamrtuLgd8pU6bgyy+/NIGjK664wtzUUV8BX9J3Hr303YUPg5PMsK0NNmXvH+yMJv7liK+rC/rWh3AEfaX2tL1FRERERERERKQpUtBXdim60BuaprC99J1HL313Eg7+5YivFfTdtWl7i4iIiIiIiIhIU6Sgr4iIiOwyGmPQV0RERERERERERKSuYuxHERERERERERERERERERGJQgr6ioiIiIiIiIiIiIiIiIhEMQV9RURERERERERERERERESimPr0FRERkV0G+/RtDNSnr4iIiIiIiIiIiISTgr4iIiIiIiIiIiIiIiIiIlFMzTuLiIiIiIiIiIiIiIiIiEQxBX1FRERERERERERERERERKKYgr4iIiIiIiIiIiIiIiIiIlFMQV8RERERERERERERERERkSimoK+IiIiIiIiIiIiIiIiISBRT0FdEREREREREREREREREJIop6CsiIiIiIiIiIiIiIiIiEsUU9BURERERERERERERERERiWIK+oqIiIiIiIiIiIiIiIiIRDEFfUVEREREREREREREREREopiCviIiIiIiIiIiIiIiIiIiUUxBXxERERERERERERERERGRKKagr4iIiIiIiIiIiIiIiIhIFFPQt4maMWOG/azxioZ1bEy0vULD7aX9QBobfd9Nn75jERERERERERERaQgK+oqIiIiIiIiIiIiIiIiIRDEFfUVEREQamcWLF+PNN9/E3XffbYZ7770Xb7/9NpYsWWLPISIiIiIiIiIiIrKDp7Cw0Gs/DytruZgyZQry8vLg9e78Eenp6ejRowf69etnj4m8kpIS/Pnnn1iwYIE9ZofU1FSzPn379kV8fLw9NnKysrKwaNEirFixAmVlZfZYn8TERLRt2xb77ruveV4bbF5y5MiR9qvgrFmzxlxMXrdunT2manFxcWjVqhVG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AAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhoi8AAAAAAABAmOgLAAAAAAAAECb6AgAAAAAAAISJvgAAAAAAAABhB27durU5HwMAAAAAAAAQc+DHH38UfQEAAAAAAACiXN4ZAAAAAAAAIEz0BQAAAAAAAAgTfQEAAAAAAADCRF8AAAAAAACAMNEXAAAAAAAAIEz0BQAAAAAAAAgTfQEAAAAAAADCRF8AAAAAAACAMNEXAAAAAAAAIOxnRt/1cfHUqXHq1MXF0d65/dFLi/c8NS7emCcAAAAAAAAAuCc7fQEAAAAAAADC9iz67uzO3Xq8c9e+39sfj5d2zv1f5899PL6fpyc77/vSR7fnmXvP/S3W39n+vS5+tPy59na3MgAAAAAAAMD9sEfRd21c/cNSgP3s7TtBdgq6L10du/Ls4vwUd7fn1sfF5fPfXh1vL73XoWPHx6HF8+0v1uc1t8f6F9PRoXH82HTmp1v7w/LnWhtv/89nAgAAAAAAAGjYs52+x3//yfjkk8Xj98e3xjuRdv0/t8PqodPvb5//5P1x9rHFxLdXx8c3pl27V8fa9ILHzo73l8/vOHR0HN9af3t7B/Dt9bH27eL5sePj6M9rvmM89er8mV4dW5/627WxrvoCAAAAAAAAIXsTfR87O559cj5+8sk5oE6Rdn3c+GwaHB9n/3mn0B4az57eDsP/Na35YbuyHj/97NaO3un80V8v19yd8dq4cWPxdPv2dkT+9dF5/U91aJz9p6Pz8dHFZ5rebfHeoi8AAAAAAAAQsjfRd2cX7l95dBxa3rX7E+1c4nnti/Wx/sW0L/jnX9pZ4AUAAAAAAAD6xvhvWMALVeyR190AAAAASUVORK5CYII=" /></p>

<p>testtttttttttttttttttttttttttttttttttttttttttttt</p>', NULL, NULL, NULL, N'test', N'testttttttt', N'tes', N'testtttttttttttttttt', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2025-01-13T14:34:00.187' AS DateTime), CAST(N'2025-01-16T03:30:11.857' AS DateTime), NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (9, NULL, NULL, 0, NULL, N'string', NULL, NULL, NULL, N'string1', N'string2', N'string3', N'string4', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'string', CAST(N'2025-01-13T16:25:44.040' AS DateTime), CAST(N'2025-01-15T07:08:53.473' AS DateTime), NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (10, NULL, NULL, 0, NULL, N'huysua', NULL, NULL, NULL, N'sua1', N'sua2', N'sua3', N'sua4', NULL, NULL, NULL, NULL, NULL, NULL, N'2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'string', N'string', CAST(N'2025-01-16T04:20:02.947' AS DateTime), CAST(N'2025-01-16T04:25:50.293' AS DateTime), NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (11, 3, NULL, 14, NULL, N'<p>string</p>', NULL, NULL, NULL, N'string', N'string', N'string', N'string', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2025-02-03T14:46:17.300' AS DateTime), CAST(N'2025-02-04T06:46:43.553' AS DateTime), NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (12, 1, NULL, 6, NULL, N'<p>tessttt65</p>', NULL, NULL, NULL, N'tessttt65', N'tessttt65', N'tessttt65', N'tessttt65', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2025-02-03T14:47:58.123' AS DateTime), NULL, NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (13, 1, NULL, 6, NULL, N'<p>C&acirc;u hỏi 1</p>', NULL, NULL, NULL, N'đúng', N'sai', N'sai', N'đúng', NULL, NULL, NULL, NULL, NULL, NULL, N'4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2025-02-05T15:50:02.127' AS DateTime), NULL, NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (14, 2, NULL, 14, NULL, N'<p>huytessttt</p>', NULL, NULL, NULL, N'huy1', N'huy2', N'huy3', N'huy4', NULL, NULL, NULL, NULL, NULL, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'string', NULL, CAST(N'2025-02-06T02:55:48.640' AS DateTime), CAST(N'2025-02-06T09:46:00.850' AS DateTime), NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (15, 0, NULL, 0, NULL, N'Testttt', NULL, NULL, NULL, N'testttt1', N'testttt2', N'testttt3', N'testttt4', NULL, NULL, NULL, NULL, NULL, NULL, N'1,2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'string', N'string', CAST(N'2025-02-06T03:05:51.423' AS DateTime), CAST(N'2025-02-06T09:38:59.363' AS DateTime), NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (16, 1, NULL, 7, NULL, N'<p>linhhhh</p>', NULL, NULL, NULL, N'linhhhh1', N'linhhhh2', N'linhhhh3', N'linhhhh4', NULL, NULL, NULL, NULL, NULL, NULL, N'1,2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2025-02-06T15:58:50.630' AS DateTime), CAST(N'2025-02-07T08:13:17.017' AS DateTime), NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (23, 3, NULL, 2, NULL, N'Câu hỏi 1', NULL, NULL, NULL, N'A1', N'A2', N'A3', N'A4', NULL, NULL, NULL, NULL, NULL, NULL, N'1,2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'admin', NULL, CAST(N'2025-02-10T06:24:16.517' AS DateTime), NULL, NULL)
INSERT [dbo].[Questions] ([ID], [QuestionCategoryID], [ParentID], [QuestionLevelID], [LectureID], [Name], [ShortContent], [Contents], [Contents2], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [Answer6], [Answer7], [Answer8], [Answer9], [Answer10], [Correct], [Comment0], [Comment1], [Comment2], [Comment3], [Comment4], [Comment5], [Comment6], [Comment7], [Comment8], [Comment9], [Comment10], [Hint1], [Hint2], [Hint3], [Hint4], [Hint5], [Hint6], [Hint7], [Hint8], [Hint9], [Hint10], [Theme], [ImageName], [ImagePath], [AudioName], [AudioPath], [DocsName], [DocsPath], [Viewers], [Status], [Keyword], [Type], [Deleted], [CreatedBy], [ModifyBy], [DateCreated], [DateModify], [Language]) VALUES (24, 1, NULL, 3, NULL, N'Câu hỏi 2', NULL, NULL, NULL, N'B1', N'B2', N'B3', N'B4', NULL, NULL, NULL, NULL, NULL, NULL, N'3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'user01', NULL, CAST(N'2025-02-10T06:24:16.517' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionType] ON 

INSERT [dbo].[QuestionType] ([ID], [Name], [Description], [Reference], [Status], [Deleted], [CreatedBy], [Index], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (1, N'testTypee', N'testType', N'testType', NULL, 0, N'string', NULL, CAST(N'2025-01-06T03:50:10.193' AS DateTime), NULL, CAST(N'2025-01-17T08:56:20.397' AS DateTime), NULL)
INSERT [dbo].[QuestionType] ([ID], [Name], [Description], [Reference], [Status], [Deleted], [CreatedBy], [Index], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (2, N'typetestttt', N'typetesttt', N'typetesttt', 0, 0, N'string', 0, CAST(N'2025-01-06T08:49:56.037' AS DateTime), N'string', CAST(N'2025-01-06T08:50:42.170' AS DateTime), 0)
INSERT [dbo].[QuestionType] ([ID], [Name], [Description], [Reference], [Status], [Deleted], [CreatedBy], [Index], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (3, N'testtttt54', N't', N't', NULL, 1, NULL, NULL, CAST(N'2025-01-14T15:16:02.333' AS DateTime), NULL, CAST(N'2025-01-20T06:21:58.633' AS DateTime), NULL)
INSERT [dbo].[QuestionType] ([ID], [Name], [Description], [Reference], [Status], [Deleted], [CreatedBy], [Index], [DateCreated], [ModifyBy], [DateModify], [Language]) VALUES (4, N'testtttt5', N'testtttt5', N'testtttt5', NULL, 1, NULL, NULL, CAST(N'2025-01-14T15:17:30.073' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
GO
ALTER TABLE [dbo].[ExamCategories] ADD  CONSTRAINT [DF_ExamCategories_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ExamCategories] ADD  CONSTRAINT [DF_ExamCategories_Index]  DEFAULT ((1)) FOR [Index]
GO
ALTER TABLE [dbo].[ExamCategories] ADD  CONSTRAINT [DF_ExamCategories_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[ExamCategories] ADD  CONSTRAINT [DF_ExamCategories_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ExamCategories] ADD  CONSTRAINT [DF_ExamCategories_Language]  DEFAULT ((1)) FOR [Language]
GO
ALTER TABLE [dbo].[ExamLevel] ADD  CONSTRAINT [DF_ExamLevel_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[ExamLevel] ADD  CONSTRAINT [DF_ExamLevel_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ExamLogs] ADD  CONSTRAINT [DF_ExamLogs_QuestionCategoryID]  DEFAULT ((0)) FOR [QuestionCategoryID]
GO
ALTER TABLE [dbo].[ExamLogs] ADD  CONSTRAINT [DF_ExamLogs_TotalScore]  DEFAULT ((1)) FOR [TotalScore]
GO
ALTER TABLE [dbo].[ExamLogs] ADD  CONSTRAINT [DF_ExamLogs_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[ExamLogs] ADD  CONSTRAINT [DF_ExamLogs_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ExamLogs] ADD  CONSTRAINT [DF_ExamLogs_Language]  DEFAULT ((1)) FOR [Language]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_ExamID]  DEFAULT ((0)) FOR [ExamID]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_QuestionCategoryID]  DEFAULT ((0)) FOR [QuestionCategoryID]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_QuestionID]  DEFAULT ((0)) FOR [QuestionID]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_Score]  DEFAULT ((0)) FOR [Score]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_TotalScore]  DEFAULT ((0)) FOR [TotalScore]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_Percents]  DEFAULT ((0)) FOR [Percents]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_ScoreInput]  DEFAULT ((0)) FOR [ScoreInput]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_ScoreOutput]  DEFAULT ((0)) FOR [ScoreOutput]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ExamResultPass] ADD  CONSTRAINT [DF_ExamResultPass_Language]  DEFAULT ((1)) FOR [Language]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_ExamID]  DEFAULT ((0)) FOR [ExamID]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_QuestionCategoryID]  DEFAULT ((0)) FOR [QuestionCategoryID]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_QuestionID]  DEFAULT ((0)) FOR [QuestionID]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_Score]  DEFAULT ((0)) FOR [Score]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_TotalScore]  DEFAULT ((0)) FOR [TotalScore]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_Percents]  DEFAULT ((0)) FOR [Percents]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_ScoreInput]  DEFAULT ((0)) FOR [ScoreInput]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_ScoreOutput]  DEFAULT ((0)) FOR [ScoreOutput]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ExamResults] ADD  CONSTRAINT [DF_ExamResults_Language]  DEFAULT ((1)) FOR [Language]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_ExamCategoryID]  DEFAULT ((0)) FOR [ExamCategoryID]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_ExamLevelID]  DEFAULT ((0)) FOR [ExamLevelID]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_ProgramID]  DEFAULT ((0)) FOR [ProgramID]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_MyProgramID]  DEFAULT ((0)) FOR [MyProgramID]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_FullTime]  DEFAULT ((0)) FOR [FullTime]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_ExistingNorms]  DEFAULT ((0)) FOR [QuestionCurrent]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_Views]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_Approve]  DEFAULT ((0)) FOR [Approve]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ExamType] ADD  CONSTRAINT [DF_ExamType_FullTime]  DEFAULT ((0)) FOR [FullTime]
GO
ALTER TABLE [dbo].[ExamType] ADD  CONSTRAINT [DF_ExamType_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ExamType] ADD  CONSTRAINT [DF_ExamType_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[ExamType] ADD  CONSTRAINT [DF_ExamType_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ExamType] ADD  CONSTRAINT [DF_ExamType_Language]  DEFAULT ((1)) FOR [Language]
GO
ALTER TABLE [dbo].[MCAccountDocument] ADD  CONSTRAINT [DF__MCAccount__Renew__5535A963]  DEFAULT ('N') FOR [RenewFlag]
GO
ALTER TABLE [dbo].[MCAccountDocument] ADD  CONSTRAINT [DF__MCAccount__State__5629CD9C]  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCAccountTypeDocument] ADD  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCDocument] ADD  CONSTRAINT [DF__MCDocumen__Apply__5BE2A6F2]  DEFAULT ('N') FOR [ApplyAllCourses]
GO
ALTER TABLE [dbo].[MCDocument] ADD  CONSTRAINT [DF__MCDocumen__Renew__5CD6CB2B]  DEFAULT ('N') FOR [RenewFlag]
GO
ALTER TABLE [dbo].[MCDocument] ADD  CONSTRAINT [DF__MCDocumen__State__5DCAEF64]  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__TYPE__24927208]  DEFAULT ('A') FOR [TYPE]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__Status__25869641]  DEFAULT ('N') FOR [Status]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__LogonEna__267ABA7A]  DEFAULT ('N') FOR [LogonEnableFlag]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__LogonMax__276EDEB3]  DEFAULT ((1)) FOR [LogonMaximumCount]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__LogonCou__286302EC]  DEFAULT ((0)) FOR [LogonCount]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__LogonFai__29572725]  DEFAULT ((0)) FOR [LogonFailedCount]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__BlackLis__2A4B4B5E]  DEFAULT ('N') FOR [BlackListFlag]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__ReportVi__2B3F6F97]  DEFAULT ('N') FOR [ReportViewAllDepartmentFlag]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__CompanyA__2C3393D0]  DEFAULT ('N') FOR [CompanyAEFlag]
GO
ALTER TABLE [dbo].[MCUser] ADD  CONSTRAINT [DF__MCUser__State__2D27B809]  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCUserAccessibleBranch] ADD  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCUserApprovalLimit] ADD  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCUserAssigment] ADD  CONSTRAINT [DF__MCUserMar__State__3E52440B]  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCUserAssigment] ADD  CONSTRAINT [DF_MCUserAssigment_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MCUserCompany] ADD  CONSTRAINT [DF__MCUserCom__State__35BCFE0A]  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCUserFunction] ADD  CONSTRAINT [DF__MCUserFun__State__38996AB5]  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCUserFunction] ADD  CONSTRAINT [DF_MCUserFunction_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MCUserGroup] ADD  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCUserParameter] ADD  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[MCUserRole] ADD  DEFAULT ('A') FOR [State]
GO
ALTER TABLE [dbo].[QuestionAnswers] ADD  CONSTRAINT [DF_Answer_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[QuestionAnswers] ADD  CONSTRAINT [DF_QuestionAnswers_Language]  DEFAULT ((1)) FOR [Language]
GO
ALTER TABLE [dbo].[QuestionCategories] ADD  CONSTRAINT [DF_Questions_FullTime]  DEFAULT ((0)) FOR [FullTime]
GO
ALTER TABLE [dbo].[QuestionCategories] ADD  CONSTRAINT [DF_QuestionCategories_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[QuestionCategories] ADD  CONSTRAINT [DF_Questions_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[QuestionGrammar] ADD  CONSTRAINT [DF_QuestionGrammar_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[QuestionGrammar] ADD  CONSTRAINT [DF_QuestionGrammar_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[QuestionGrammar] ADD  CONSTRAINT [DF_QuestionGrammar_Language]  DEFAULT ((0)) FOR [Language]
GO
ALTER TABLE [dbo].[QuestionGroups] ADD  CONSTRAINT [DF_QuestionGroups_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[QuestionGroups] ADD  CONSTRAINT [DF_QuestionGroups_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[QuestionGroups] ADD  CONSTRAINT [DF_QuestionGroups_Language]  DEFAULT ((0)) FOR [Language]
GO
ALTER TABLE [dbo].[QuestionLevel] ADD  CONSTRAINT [DF_QuestionLevel_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_QuestionLevelID]  DEFAULT ((0)) FOR [QuestionLevelID]
GO
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_Theme]  DEFAULT ((0)) FOR [Theme]
GO
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_Questions_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF_QuestionCategories_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[QuestionType] ADD  CONSTRAINT [DF_QuestionType_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[QuestionType] ADD  CONSTRAINT [DF_QuestionType_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[QuestionType] ADD  CONSTRAINT [DF_QuestionType_Language]  DEFAULT ((0)) FOR [Language]
GO
/****** Object:  StoredProcedure [dbo].[EL_GetAllQuestion]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestion
CREATE PROCEDURE [dbo].[EL_GetAllQuestion]
AS
BEGIN

     SELECT 
	 ID,
	 Name,
	 Answer1,
	 Answer2,
	 Answer3,
	 Answer4,
	 Correct,
	 CreatedBy,
	 ModifyBy,
	 DateCreated,
	 DateModify
    FROM Questions 
	WHERE Questions.Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetAllQuestionCategories]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionGrammar
CREATE PROCEDURE [dbo].[EL_GetAllQuestionCategories]
AS
BEGIN

     SELECT * 
    FROM QuestionCategories qc
	WHERE qc.Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetAllQuestionGrammar]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionGrammar
CREATE PROCEDURE [dbo].[EL_GetAllQuestionGrammar]
AS
BEGIN

     SELECT * 
    FROM QuestionGrammar q
	WHERE q.Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetAllQuestionGroups]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionGroups
CREATE PROCEDURE [dbo].[EL_GetAllQuestionGroups]
AS
BEGIN

     SELECT * 
    FROM QuestionGroups q
	WHERE q.Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetAllQuestionLevel]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionLevel
CREATE PROCEDURE [dbo].[EL_GetAllQuestionLevel]
AS
BEGIN

     SELECT * 
    FROM QuestionLevel q
	where q.Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetAllQuestionType]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionType
CREATE PROCEDURE [dbo].[EL_GetAllQuestionType]
AS
BEGIN

     SELECT * 
    FROM QuestionType q
	WHERE q.Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetDetailQuestion]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetDetailQuestion ''
CREATE PROCEDURE [dbo].[EL_GetDetailQuestion]
	@id int
AS
BEGIN
     SELECT 
	 q.ID,
	 q.Name,
	 q.Answer1,
	 q.Answer2,
	 q.Answer3,
	 q.Answer4,
	 q.Correct,
	 q.QuestionCategoryID,
	 q.QuestionLevelID
    FROM Questions q
	WHERE q.ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetDetailQuestionCategories]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionCategories
CREATE PROCEDURE [dbo].[EL_GetDetailQuestionCategories]
	@id int
AS
BEGIN

     SELECT * 
    FROM QuestionCategories qc	
	WHERE qc.ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetDetailQuestionGrammar]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionGrammar
CREATE PROCEDURE [dbo].[EL_GetDetailQuestionGrammar]
	@id int
AS
BEGIN

     SELECT * 
    FROM QuestionGrammar qg	
	WHERE qg.ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetDetailQuestionGroups]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionGroups
CREATE PROCEDURE [dbo].[EL_GetDetailQuestionGroups]
	@id int
AS
BEGIN

     SELECT * 
    FROM QuestionGroups qg
	WHERE qg.ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetDetailQuestionLevel]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionLevel
CREATE PROCEDURE [dbo].[EL_GetDetailQuestionLevel]
@id int
AS
BEGIN

     SELECT * 
    FROM QuestionLevel ql
	WHERE ql.ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[EL_GetDetailQuestionType]    Script Date: 2/14/2025 4:48:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec EL_GetAllQuestionType
CREATE PROCEDURE [dbo].[EL_GetDetailQuestionType]
@id int
AS
BEGIN

     SELECT * 
    FROM QuestionType qt
	WHERE qt.ID = @id
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đồ uống, đồ ăn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExamCategories', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn vị' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Exams', @level2type=N'COLUMN',@level2name=N'Progress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tồn định mức' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Exams', @level2type=N'COLUMN',@level2name=N'QuestionCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'theo format email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MCEmp', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A=Active; S=Spending; L=Locked; C=Closed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MCEmp', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cấp cha' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MCEmp', @level2type=N'COLUMN',@level2name=N'SupervisorUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Kanji, 2:Điền từ, 3:Nghe hiểu,4: Ngữ pháp, 5:Đọc hiểu (japanese) <=>English' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestionAnswers', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phân lại chủ thể' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestionCategories', @level2type=N'COLUMN',@level2name=N'QuestionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chương trình học của tôi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestionCategories', @level2type=N'COLUMN',@level2name=N'MyProgramID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Bai Tap; 2: Cau hoi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QuestionCategories', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Cau hoi, 2: Bai Tap, -1 Bai giang' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Questions', @level2type=N'COLUMN',@level2name=N'Status'
GO
USE [master]
GO
ALTER DATABASE [eLearning] SET  READ_WRITE 
GO
