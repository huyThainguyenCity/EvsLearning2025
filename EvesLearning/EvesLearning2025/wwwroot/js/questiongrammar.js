$(document).ready(function () {
    function fetchData() {
        $.ajax({
            url: "https://localhost:7118/api/Question/GetAllQuestionGrammar",
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
                            <td>${getValue(item.ShortContent)}</td>
                            <td>${getValue(item.Content)}</td>
                            <td>${getValue(item.Image)}</td>
                            <td>${getValue(item.CreatedBy)}</td>
                            <td>${getValue(item.DateCreated)}</td>
                            <td>${getValue(item.ModifyBy)}</td>
                            <td>${getValue(item.DateModify)}</td>
                            <td>${getValue(item.Language)}</td>
                            <td>
                                <button type="button" class="btn btn-primary" data-id="${item.ID}">Cập nhật</button>
                                <button type="button" class="btn btn-danger" data-id="${item.ID}">Xóa</button>
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
            ShortContent: $("#shortContent").val().trim(),
            Content: $("#contents").val().trim()
        };

        if (!newQuestionLevel.Name) {
            alert("Tên không được để trống!");
            return;
        }
        
        console.log(newQuestionLevel);

        $.ajax({
            url: "https://localhost:7118/api/Question/QuestionGrammar",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(newQuestionLevel),
            success: function (data) {
                console.log("New Question Group added:", data);
                alert("Thêm mới thành công!");

                fetchData();

                const modalElement = $("#addNewGrammar");
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
});
