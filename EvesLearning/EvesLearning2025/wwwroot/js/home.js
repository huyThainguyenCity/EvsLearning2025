$(document).ready(function () {
    function fetchData() {
        $.ajax({
            url: `${apiBaseUrl}/api/Exam/GetAllExam`,
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({}), // Nếu API cần body rỗng
            success: function (data) {
                if (!data || data.length === 0) {
                    $(".wrapper-item.archive-courses.row").html("<p class='text-center'>Không có khóa học nào.</p>");
                    return;
                }

                console.log("Dữ liệu từ API:", data);

                var html = `
                    <div class="text-center">
                        <div id="panel-22-2-0-1" class="so-panel widget widget_courses panel-last-child" data-index="3">
                            <div class="thim-widget-courses thim-widget-courses-base">
                                <div class="wrapper-item archive-courses row" data-show-page-nav="1" 
                                    itemscope itemtype="http://schema.org/CreativeWork">
                                    ${data.map(exam => `
                                        <article class="col-sm-3">
                                            <div class="inner-course">
                                                <div class="wrapper-course-thumbnail">
                                                    <a class="course-thumbnail" href="#" data-id="${exam.ID}">
                                                        <img loading="lazy" decoding="async" src="/image/course-6-1-450x450.jpg" 
                                                            alt="${exam.quesCateName || 'Course Image'}" 
                                                            title="${exam.quesCateName || 'Course Image'}" 
                                                            width="450" height="450">
                                                    </a>
                                                    <div class="teacher_course">
                                                        <div class="author-wrapper clearfix">
                                                            <div class="author-avatar">
                                                                <img src="https://secure.gravatar.com/avatar/f686c3793021c20c9b57f7e8b301a4e8?s=96&amp;d=mm&amp;r=g" 
                                                                     height="50" width="50">
                                                            </div>
                                                            <div class="author-bio">
                                                                <div class="author-top">
                                                                    <a class="name">Tên đề thi: ${exam.Name || 'Unknown'}</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="course-title">
                                                    <h2><a class="exam-link" href="#" data-id="${exam.ID}">Tên môn học: ${exam.quesCateName || 'No Title'}</a></h2>
                                                </div>
                                                <div class="wrapper-course-price">
                                                    <div class="course-price">
                                                        <span class="course-item-price">
                                                            <span class="free">Thời gian thi: ${exam.FullTime || 'N/A'}</span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="course-students">
                                                    <span>
                                                        <strong class="students">
                                                            Số câu hỏi: ${exam.Total || 0} câu
                                                        </strong>
                                                    </span>
                                                </div>
                                            </div>
                                        </article>
                                    `).join('')}
                                </div>
                            </div>
                        </div>
                    </div>
                `;

                // Chèn HTML vào DOM
                $(".wrapper-item.archive-courses.row").html(html);
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi gọi API:", error);
                $(".wrapper-item.archive-courses.row").html("<p class='text-center text-danger'>Lỗi khi tải danh sách khóa học.</p>");
            }
        });
    }

    // Gọi hàm fetchData khi trang tải xong
    fetchData();

    $(document).ready(function () {
        // Xử lý sự kiện click trên `.course-thumbnail`
        $(".wrapper-item").on("click", ".course-thumbnail", function (e) {
            e.preventDefault();
            var examId = $(this).data("id");
            if (examId) {
                sessionStorage.setItem("examId", examId);
                window.location.href = "/Question/Index";
            } else {
                alert("Lỗi: ExamId không hợp lệ!");
            }
        });

        $(".wrapper-item").on("click", ".exam-link", function (e) {
            e.preventDefault();
            console.log("Click vào exam-link!");
            var examId = $(this).data("id");
            console.log("examId:", examId);
            if (examId) {
                sessionStorage.setItem("examId", examId);
                window.location.href = "/Question/Index";
            } else {
                alert("Lỗi: ExamId không hợp lệ!");
            }
        });
        
    });

});
