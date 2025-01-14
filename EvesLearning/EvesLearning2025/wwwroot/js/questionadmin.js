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
                            <td>
                                ${item.Name && item.Name.startsWith("http")
                            ? `<img class="img" src="${getValue(item.Name)}" alt="Image" >`
                            : getValue(item.Name)}
                            </td>
                            <td>${getValue(item.Answer1)}</td>
                            <td>${getValue(item.Answer2)}</td>
                            <td>${getValue(item.Answer3)}</td>
                            <td>${getValue(item.Answer4)}</td>
                            <td>${getValue(item.Correct)}</td>
                            <td>${getValue(item.CreatedBy)}</td>
                            <td>${getValue(item.ModifyBy)}</td>
                            <td>${getValue(item.DateCreated)}</td>
                            <td>${getValue(item.DateModify)}</td>    
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
                console.error("Lỗi khi lấy dữ liệu từ server:", status, error, xhr.responseText);
                alert("Có lỗi xảy ra khi lấy dữ liệu từ server. Vui lòng thử lại!");
            }
        });
    }

    fetchData();

    const addNewForm = $("#addNewForm");
    CKEDITOR.replace("name"); // Khởi tạo CKEditor


    addNewForm.on("submit", function (event) {
        event.preventDefault(); // Ngừng hành vi gửi form mặc định

        const selectedCorrectAnswer = $('input[name="correctAnswer"]:checked').val();
        if (!selectedCorrectAnswer) {
            alert("Vui lòng chọn đáp án đúng!");
            return;
        }

        const newQuestionLevel = {
            Name: CKEDITOR.instances.name.getData().trim(),
            Answer1: $("#answer1").val().trim(),
            Answer2: $("#answer2").val().trim(),
            Answer3: $("#answer3").val().trim(),
            Answer4: $("#answer4").val().trim(),
            Correct: selectedCorrectAnswer
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
                CKEDITOR.instances.name.setData(""); // Xóa nội dung CKEditor
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi thêm mới:", status, error, xhr.responseText);
                alert("Có lỗi xảy ra khi thêm mới.");
            }
        });
    });
});
