$(document).ready(function () {
    function fetchData() {
        $.ajax({
            url: "https://localhost:7118/api/Question/GetAllQuestionLevel",
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
                            <td>${getValue(item.Status)}</td>
                            <td>${getValue(item.Index)}</td>
                            <td>${getValue(item.Deleted)}</td>
                            <td>${getValue(item.CreatedBy)}</td>
                            <td>${getValue(item.ModifyBy)}</td>
                            <td>${getValue(item.DateCreated)}</td>
                            <td>${getValue(item.DateModify)}</td>
                            <td>${getValue(item.Language)}</td>
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
            Name: $("#name").val().trim() 
        };

        if (!newQuestionLevel.Name) {
            alert("Tên không được để trống!");
            return;
        }

        $.ajax({
            url: "https://localhost:7118/api/Question/QuestionLevel",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(newQuestionLevel), 
            success: function (data) {
                console.log("New Question Level added:", data);
                alert("Thêm mới thành công!");

                fetchData();

                const modalElement = $("#addNewLevel");
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
