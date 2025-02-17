using System;
using System.Collections.Generic;

namespace BusinessObject.Models
{
    public partial class Exam
    {
        public int Id { get; set; }
        public int? ExamCategoryId { get; set; }
        public int? ExamLevelId { get; set; }
        public int? ProgramId { get; set; }
        public int? MyProgramId { get; set; }
        public string? QuestionListId { get; set; }
        public string? Name { get; set; }
        public string? ShortContent { get; set; }
        public string? Content { get; set; }
        public int? FullTime { get; set; }
        /// <summary>
        /// Đơn vị
        /// </summary>
        public double? Progress { get; set; }
        /// <summary>
        /// Tồn định mức
        /// </summary>
        public double? QuestionCurrent { get; set; }
        public int? Total { get; set; }
        public string? PromotionalId { get; set; }
        public string? Descriptions { get; set; }
        public string? Note { get; set; }
        public int? Views { get; set; }
        public int? Status { get; set; }
        public string? ImageName { get; set; }
        public string? ImagePath { get; set; }
        public string? Video { get; set; }
        public string? VideoPath { get; set; }
        public string? Audio { get; set; }
        public string? AudioPath { get; set; }
        public int? Type { get; set; }
        public int? Approve { get; set; }
        public int? Deleted { get; set; }
        public DateTime? LastLogin { get; set; }
        public string? Iplogin { get; set; }
        public string? BarcodeNew { get; set; }
        public string? BarcodeOld { get; set; }
        public DateTime? BarcodeDate { get; set; }
        public string? PageTitle { get; set; }
        public string? PageKeywords { get; set; }
        public string? PageDescription { get; set; }
        public string? CreatedBy { get; set; }
        public string? ModifyBy { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModify { get; set; }
        public int? Language { get; set; }
    }
}
