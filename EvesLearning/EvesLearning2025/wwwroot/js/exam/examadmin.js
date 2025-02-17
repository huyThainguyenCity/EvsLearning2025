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
                            <td>${getValue(item.DateCreated)}</td>
                            <td>${getValue(item.ModifyBy)}</td>
                            <td>${getValue(item.DateModify)}</td>
                            <td>
                               <button type="button" class="btn btn-primary btn-update" data-id="${item.ID}">Cập nhật</button>
                               <button type="button" class="btn btn-danger btn-delete" data-id="${item.ID}">Xóa</button>
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
    let questionsList = [
        { levelName: "", questionCount: "" }
    ];

    // Hàm render lại tbody từ mảng questionsList
    function renderTable() {
        const tableBody = $("#questionsTable tbody");
        tableBody.empty(); // Xóa nội dung cũ để cập nhật lại

        questionsList.forEach((item, index) => {
            let row = `
                <tr>
                    <td>
                        <input type="text" class="form-control level-input" value="${item.levelName}" 
                            data-index="${index}" data-field="levelName" placeholder="Nhập tên cấp độ">
                    </td>
                    <td>
                        <input type="number" class="form-control question-input" value="${item.questionCount}" 
                            data-index="${index}" data-field="questionCount" placeholder="Nhập số lượng câu hỏi">
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

    // Hàm cập nhật dữ liệu khi người dùng nhập
    $(document).on("input", ".level-input, .question-input", function () {
        const index = $(this).data("index");
        const field = $(this).data("field");
        questionsList[index][field] = $(this).val();
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
    });

    // Khi nhấn nút "Thêm câu hỏi"
    $("#addQuestionBtn").click(function () {
        addRow();
    });

    // Gọi renderTable() ngay khi trang load để có sẵn 1 dòng input
    renderTable();

});
