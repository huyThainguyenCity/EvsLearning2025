$(document).ready(function () {
    let apiBaseUrl = "https://localhost:7118";

    function fetchData() {
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetAllQuestion`,
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
                                <button type="button" class="btn btn-primary btn-update" data-id="${item.ID}">Cập nhật</button>
                                <button type="button" class="btn btn-danger btn-delete" data-id="${item.ID}">Xóa</button>
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

    function handleAddNewClick() {
        console.log("handleAddNewClick() đã được gọi!"); // Debug kiểm tra nút có hoạt động không
        fetchCategories();  // Gọi API danh mục
        fetchLevels();      // Gọi API mức độ
       
    }

    $("button[data-bs-toggle='modal']").on("click", function () {
        handleAddNewClick();  // Khi bấm nút "Thêm mới", gọi hàm này
    });

    // Hàm gọi API danh mục
    function fetchCategories() {
        console.log("testcategory");
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetAllQuestionCategories`,
            type: "POST",
            contentType: "application/json",
            success: function (categories) {
                const categorySelect = $("#category");
                categorySelect.empty().append('<option value="">-- Chọn thể loại --</option>');

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
    
    // Hàm gọi API mức độ
    function fetchLevels() {
        console.log("testlevel");
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetAllQuestionLevel`,
            type: "POST",
            contentType: "application/json",
            success: function (levels) {
                const levelSelect = $("#level");
                levelSelect.empty().append('<option value="">-- Chọn mức độ --</option>');

                levels.forEach(level => {
                    levelSelect.append(`<option value="${level.ID}">${level.Name}</option>`);
                });
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy mức độ:", status, error, xhr.responseText);
                alert("Có lỗi khi tải mức độ, vui lòng thử lại!");
            }
        });
    }

    // Hàm gọi API danh mục
    function fetchCategoriesUpdate(selectedId) {
        console.log("fetchCategoriesUpdate");
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetAllQuestionCategories`,
            type: "POST",
            contentType: "application/json",
            success: function (categories) {
                const categorySelect = $("#updatecategory");
                categorySelect.empty().append('<option value="">-- Chọn thể loại --</option>');

                categories.forEach(cat => {
                    categorySelect.append(`<option value="${cat.ID}">${cat.Name}</option>`);
                });

                if (selectedId) {
                    categorySelect.val(selectedId); // Gán giá trị sau khi load xong
                }
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy thể loại:", status, error, xhr.responseText);
                alert("Có lỗi khi tải thể loại, vui lòng thử lại!");
            }
        });
    }

    // Hàm gọi API mức độ
    function fetchLevelsUpdate(selectedId) {
        console.log("fetchLevelsUpdate");
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetAllQuestionLevel`,
            type: "POST",
            contentType: "application/json",
            success: function (levels) {
                const levelSelect = $("#updatelevel");
                levelSelect.empty().append('<option value="">-- Chọn mức độ --</option>');

                levels.forEach(level => {
                    levelSelect.append(`<option value="${level.ID}">${level.Name}</option>`);
                });

                if (selectedId) {
                    levelSelect.val(selectedId); // Gán giá trị sau khi load xong
                }
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy mức độ:", status, error, xhr.responseText);
                alert("Có lỗi khi tải mức độ, vui lòng thử lại!");
            }
        });
    }

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
            QuestionCategoryID: $("#category").val(),  // Lấy giá trị ID của danh mục đã chọn
            QuestionLevelID: $("#level").val(),       // Lấy giá trị ID của mức độ đã chọn
            Correct: selectedCorrectAnswer
        };

        if (!newQuestionLevel.Name) {
            alert("Tên không được để trống!");
            return;
        }

        $.ajax({
            url: `${apiBaseUrl}/api/Question`,
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

    const updateModal = new bootstrap.Modal($("#updateLevel")); // Modal "Cập nhật"
    let ckeditorInstance; // Biến để lưu CKEditor instance

    // Xử lý khi nhấn nút "Cập nhật"
    $("table").on("click", ".btn-update", function () {
        const questionId = $(this).data("id");
       
        
                $.ajax({
                    url: `${apiBaseUrl}/api/Question/${questionId}`,
                    type: "GET",
                    contentType: "application/json",
                    success: function (data) {
                        console.log("Dữ liệu câu hỏi:", data);

                        fetchCategoriesUpdate(data.QuestionCategoryID);
                        fetchLevelsUpdate(data.QuestionLevelID);

                        $("#updateName").val(data.Name || "");
                        $("#updateAnswer1").val(data.Answer1 || "");
                        $("#updateAnswer2").val(data.Answer2 || "");
                        $("#updateAnswer3").val(data.Answer3 || "");
                        $("#updateAnswer4").val(data.Answer4 || "");
                        $("#updateCategory").val(data.QuestionCategoryID || "");
                        $("#updateLevel").val(data.QuestionLevelID || "");

                        $(`input[name="updateCorrectAnswer"][value="${data.Correct}"]`).prop("checked", true);

                        $("#updateForm").data("id", questionId);

                        if (ckeditorInstance) {
                            ckeditorInstance.destroy(true);
                        }
                        ckeditorInstance = CKEDITOR.replace("updateName");

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

        const selectedCorrectAnswer = $('input[name="updateCorrectAnswer"]:checked').val();
        if (!selectedCorrectAnswer) {
            alert("Vui lòng chọn đáp án đúng!");
            return;
        }

        const updatedQuestion = {
            ID: questionId, 
            Name: CKEDITOR.instances.updateName.getData().trim(), 
            Answer1: $("#updateAnswer1").val().trim(),
            Answer2: $("#updateAnswer2").val().trim(),
            Answer3: $("#updateAnswer3").val().trim(),
            Answer4: $("#updateAnswer4").val().trim(),
            Correct: selectedCorrectAnswer,
            QuestionCategoryID: $("#updatecategory").val(),
            QuestionLevelID: $("#updatelevel").val()
        };

        $.ajax({
            url: `${apiBaseUrl}/api/Question`, 
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
});