$(document).ready(function () {
    function fetchData() {
        $.ajax({
            url: "https://localhost:7118/api/Question/GetAllQuestion",
            type: "POST",
            contentType: "application/json",
            success: function (data) {
                const tableBody = $("table tbody");
                tableBody.empty(); // Xóa nội dung cũ (nếu có)

                console.log(data);
                data.forEach(item => {
                    const getValue = (value) => value === null || value === undefined ? "" : value;

                    const row = `
                        <tr>
                            <td>${getValue(item.ID)}</td>
                            <td>${getValue(item.Name)}</td>
                            <td>${getValue(item.Answer1)}</td>
                            <td>${getValue(item.Answer2)}</td>
                            <td>${getValue(item.Answer3)}</td>
                            <td>${getValue(item.Answer4)}</td>
                            <td>${getValue(item.Correct)}</td>
                            <td>${getValue(item.CreatedBy)}</td>
                            <td>${getValue(item.ModifyBy)}</td>
                            <td>${getValue(item.DateCreated)}</td>
                            <td>${getValue(item.DateModify)}</td>
                        </tr>
                    `;
                    tableBody.append(row);
                });
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy dữ liệu từ server:", status, error, xhr.responseText);
                alert("Có lỗi xảy ra khi lấy dữ liệu từ server. Vui lòng thử lại!");
            }
        });
    }

    fetchData();

    const addNewForm = $("#addNewForm");

    addNewForm.on("submit", function (event) {
        event.preventDefault(); // Ngừng hành vi gửi form mặc định

        const newQuestionLevel = {
            Name: $("#name").val().trim(),
            Answer1: $("#answer1").val().trim(),
            Answer2: $("#answer2").val().trim(),
            Answer3: $("#answer3").val().trim(),
            Answer4: $("#answer4").val().trim(),
            Correct: $("#correct").val().trim()
        };

        if (!newQuestionLevel.Name) {
            alert("Tên không được để trống!");
            return;
        }

        $.ajax({
            url: "https://localhost:7118/api/Question",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(newQuestionLevel),
            success: function (data) {
                console.log("New Question Level added:", data);
                alert("Thêm mới thành công!");

                fetchData(); // Làm mới dữ liệu sau khi thêm thành công

                const modalElement = $("#addNewLevel");
                const modal = bootstrap.Modal.getInstance(modalElement[0]); // Lấy đối tượng modal hiện tại
                modal.hide(); // Đóng modal

                addNewForm[0].reset(); // Reset form
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi thêm mới:", status, error, xhr.responseText);
                alert("Có lỗi xảy ra khi thêm mới.");
            }
        });
    });
});
