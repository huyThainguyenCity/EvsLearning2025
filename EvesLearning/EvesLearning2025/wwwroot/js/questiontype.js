$(document).ready(function () {

    function fetchData() {
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetAllQuestionType`,
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
                            <td>${getValue(item.Description)}</td>
                            <td>${getValue(item.Reference)}</td>
                            <td>${getValue(item.Status)}</td>
                            <td>${getValue(item.Deleted)}</td>
                            <td>${getValue(item.Index)}</td>
                            <td>${getValue(item.CreatedBy)}</td>
                            <td>${getValue(item.DateCreated)}</td>
                            <td>${getValue(item.ModifyBy)}</td>
                            <td>${getValue(item.DateModify)}</td>
                            <td>${getValue(item.Language)}</td>
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

    const addNewForm = $("#addNewForm");

    addNewForm.on("submit", function (event) {
        event.preventDefault();

        const newQuestionLevel = {
            Name: $("#name").val().trim(),
            Description: $("#description").val().trim(),
            Reference: $("#reference").val().trim()
        };

        if (!newQuestionLevel.Name) {
            alert("Tên không được để trống!");
            return;
        }

        $.ajax({
            url: `${apiBaseUrl}/api/Question/QuestionType`,
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(newQuestionLevel),
            success: function (data) {
                console.log("New Question Level added:", data);
                alert("Thêm mới thành công!");

                fetchData();

                const modalElement = $("#addNewType");
                const modal = bootstrap.Modal.getInstance(modalElement[0]);
                modal.hide();

                addNewForm[0].reset();
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi thêm mới.");
            }
        });
    });

    const updateModal = new bootstrap.Modal($("#updateLevel")); // Modal "Cập nhật"

    // Xử lý khi nhấn nút "Cập nhật"
    $("table").on("click", ".btn-update", function () {
        const questionId = $(this).data("id");

        $.ajax({
            url: `${apiBaseUrl}/api/Question/QuestionType/${questionId}`,
            type: "GET",
            contentType: "application/json",
            success: function (data) {
                console.log("Dữ liệu câu hỏi:", data);

                $("#updateName").val(data.Name || "");
                $("#updateDescription").val(data.Description || "");
                $("#updateReference").val(data.Reference || "");


                $("#updateForm").data("id", questionId);

                updateModal.show();
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy dữ liệu câu hỏi:", error);
                alert("Có lỗi xảy ra khi lấy dữ liệu câu hỏi.");
            }
        });
    });

    // Xử lý khi submit form "Cập nhật"
    $("#updateForm").on("submit", function (event) {
        event.preventDefault();

        const questionId = $(this).data("id");



        const updatedQuestion = {
            ID: questionId,
            Name: $("#updateName").val().trim(),
            Description: $("#updateDescription").val().trim(),
            Reference: $("#updateReference").val().trim()
        };

        $.ajax({
            url: `${apiBaseUrl}/api/Question/QuestionType`,
            type: "PUT",
            contentType: "application/json",
            data: JSON.stringify(updatedQuestion),
            success: function (data) {
                alert("Cập nhật thành công!");
                updateModal.hide();
                fetchData();
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi cập nhật dữ liệu:", error);
                alert("Có lỗi xảy ra khi cập nhật dữ liệu.");
            }
        });
    });

    // Xử lý khi nhấn nút "Xóa"
    $("table").on("click", ".btn-delete", function () {
        const questionId = $(this).data("id");

        if (!confirm("Bạn có chắc chắn muốn xóa không?")) {
            return;
        }

        $.ajax({
            url: `${apiBaseUrl}/api/Question/QuestionType/${questionId}`,
            type: "DELETE",
            contentType: "application/json",
            success: function (response) {
                alert("Xóa thành công!");
                fetchData();
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi xóa:", error);
                alert("Có lỗi xảy ra khi xóa.");
            }
        });
    });
});
