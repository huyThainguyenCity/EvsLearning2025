$(document).ready(function () {

    function fetchData() {
        $.ajax({
            url: `${apiBaseUrl}/api/Exam/GetAllExam`,
            type: "POST",
            contentType: "application/json",
            success: function (data) {
                const tableBody = $("table tbody");

                tableBody.empty();
                console.log(data);

                const formatDate = (date) => {
                    if (!date) return ""; // Kiểm tra null hoặc undefined
                    const d = new Date(date);
                    return d.toLocaleDateString('vi-VN') + " " + d.toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' });
                };

                data.forEach(item => {
                    const getValue = (value) => value === null || value === undefined ? "" : value;

                    const row = `
                        <tr>
                            <td>${getValue(item.ID)}</td>
                            <td>${getValue(item.Name)}</td>
                            <td>${getValue(item.quesCateName)}</td>
                            <td>${getValue(item.Total)}</td>
                            <td>${getValue(item.FullTime)}</td>
                            <td>${getValue(item.CreatedBy)}</td>
                            <td>${formatDate(item.DateCreated)}</td>
                            <td>${getValue(item.ModifyBy)}</td>
                            <td>${formatDate(item.DateModify)}</td>
                            <td>
                               <button type="button" class="btn btn-primary btn-update" data-id="${item.ID}">Xuất câu hỏi</button>
                            </td> 
                        </tr>
                    `;
                    tableBody.append(row);
                });
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi lấy dữ liệu từ server. Vui lòng thử lại!");
            }
        });
    }

    fetchData();

    // Mảng lưu dữ liệu câu hỏi (bắt đầu với một dòng mặc định)
    let questionsList = [{ levelId: "", questionCount: "" }];

    // Mảng lưu danh sách mức độ từ API
    let levelOptions = []; 

    // Hàm render lại tbody từ mảng questionsList
    function renderTable() {
        const tableBody = $("#questionsTable tbody");
        tableBody.empty(); // Xóa nội dung cũ để cập nhật lại

        questionsList.forEach((item, index) => {

            let options = levelOptions.map(level =>
                `<option value="${level.id}" ${level.id == item.levelId ? 'selected' : ''}>${level.name}</option>`
            ).join("");

            let row = `
<tr>
    <td>
        <select class="form-control level-select" data-index="${index}">
            <option value="">-- Chọn mức độ --</option>
            ${levelOptions.map(level =>
                `<option value="${level.id}" ${level.id == item.levelId ? 'selected' : ''}>${level.name}</option>`
            ).join("")}
        </select>
    </td>
    <td>
        <input type="number" class="form-control question-input" value="${item.questionCount}" 
            data-index="${index}" placeholder="Nhập số lượng câu hỏi">
    </td>
    <td class="text-center">
        <button class="btn btn-danger btn-sm remove-row" data-index="${index}">
            <i class="fas fa-trash"></i>
        </button>
    </td>
</tr>
`;
            tableBody.append(row);
        });
    }

    // Hàm thêm dòng mới
    function addRow() {
        console.log("test them");
        questionsList.push({
            levelName: "",
            questionCount: ""
        });

        renderTable();
    }

    // Cập nhật số lượng câu hỏi khi nhập
    $(document).on("input", ".question-input", function () {
        const index = $(this).data("index");
        questionsList[index].questionCount = $(this).val();
    });

    // Cập nhật LevelId khi chọn mức độ
    $(document).on("change", ".level-select", function () {
        const index = $(this).data("index");
        questionsList[index].levelId = $(this).val(); // Lưu ID mức độ thay vì tên
    });


    // Hàm xóa dòng (không cho xóa nếu chỉ còn 1 dòng)
    $(document).on("click", ".remove-row", function () {
        if (questionsList.length > 1) {
            const index = $(this).data("index");
            questionsList.splice(index, 1);
            renderTable();
        } else {
            alert("Phải có ít nhất một dòng!");
        }
    });

    // Khi modal mở, render bảng với ít nhất một dòng input
    $("#addNewLevel").on("shown.bs.modal", function () {
        renderTable();
        fetchCategories();
        fetchLevels();
    });

    // Khi nhấn nút "Thêm câu hỏi"
    $("#addQuestionBtn").click(function () {
        addRow();
    });

    // Gọi renderTable() ngay khi trang load để có sẵn 1 dòng input
    renderTable();

    // Hàm gọi API danh mục
    function fetchCategories() {
        console.log("testcategory");
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetAllQuestionCategories`,
            type: "POST",
            contentType: "application/json",
            success: function (categories) {
                const categorySelect = $("#category");
                categorySelect.empty().append('<option value="">-- Chọn môn học --</option>');

                categories.forEach(cat => {
                    categorySelect.append(`<option value="${cat.ID}">${cat.Name}</option>`);
                });
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy thể loại:", status, error, xhr.responseText);
                alert("Có lỗi khi tải thể loại, vui lòng thử lại!");
            }
        });
    }


    function fetchLevels() {
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetAllQuestionLevel`,
            type: "POST",
            contentType: "application/json",
            success: function (levels) {
                levelOptions = levels.map(level => ({
                    id: level.ID,
                    name: level.Name
                }));
                renderTable(); // Render lại bảng sau khi có danh sách mức độ
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy mức độ:", status, error, xhr.responseText);
                alert("Có lỗi khi tải mức độ, vui lòng thử lại!");
            }
        });
    }

    const addNewForm = $("#addNewForm");

    addNewForm.on("submit", function (event) {
        event.preventDefault();

        // Thu thập dữ liệu từ form
        const newExam = {
            Name: $("#name").val().trim(),
            ExamCategoryID: parseInt($("#category").val().trim()), // Chuyển sang kiểu số nếu cần
            FullTime: parseInt($("#fulltime").val().trim()), // Thời gian làm bài
            Total: questionsList.reduce((sum, q) => sum + parseInt(q.questionCount || 0), 0),
            ExamCount: parseInt($("#totalExam").val().trim()), 
            QuestionLevels: questionsList.reduce((acc, q) => {
                // Chuyển đổi câu hỏi thành cặp khóa-giá trị cho Dictionary
                acc[parseInt(q.levelId)] = parseInt(q.questionCount);
                return acc;
            }, {}) // Chuyển mảng thành object (Dictionary)
        };

        // Kiểm tra dữ liệu hợp lệ
        if (!newExam.Name) {
            alert("Tên đề thi không được để trống!");
            return;
        }
        if (!newExam.ExamCategoryID) {
            alert("Vui lòng chọn môn học!");
            return;
        }
        if (isNaN(newExam.FullTime) || newExam.FullTime <= 0) {
            alert("Thời gian làm bài phải là số lớn hơn 0!");
            return;
        }
        if (isNaN(newExam.ExamCount) || newExam.ExamCount <= 0) {
            alert("Số lượng đề thi phải là số lớn hơn 0!");
            return;
        }
        if (newExam.QuestionLevels.length === 0) {
            alert("Vui lòng thêm ít nhất một câu hỏi!");
            return;
        }
        for (const [levelId, questionCount] of Object.entries(newExam.QuestionLevels)) {
            if (isNaN(levelId)) {
                alert("Vui lòng chọn mức độ cho tất cả các câu hỏi!");
                return;
            }
            if (isNaN(questionCount) || questionCount <= 0) {
                alert("Số lượng câu hỏi phải là số lớn hơn 0!");
                return;
            }
        }

        console.log("Dữ liệu gửi đi:", newExam);

        //Gửi dữ liệu lên API
        $.ajax({
            url: `${apiBaseUrl}/api/Exam`,
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(newExam),
            success: function (response) {
                console.log("Exam added successfully:", response);
                alert("Thêm đề thi thành công!");

                fetchData(); // Refresh danh sách đề thi

                // Đóng modal
                const modalElement = $("#addNewLevel");
                const modal = bootstrap.Modal.getInstance(modalElement[0]);
                modal.hide();

                addNewForm[0].reset(); // Reset form
                questionsList = []; // Reset danh sách câu hỏi
                renderTable(); // Cập nhật bảng
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi gửi yêu cầu:", xhr.responseText);
                alert("Có lỗi xảy ra khi thêm đề thi, vui lòng thử lại!");
            }
        });
    });


});
