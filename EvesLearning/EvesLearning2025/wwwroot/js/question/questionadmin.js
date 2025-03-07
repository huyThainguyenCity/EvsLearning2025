﻿$(document).ready(function () {

    function fetchData() {
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetAllQuestion`,
            type: "POST",
            contentType: "application/json",
            success: function (data) {
                const tableBody = $("table tbody");
                tableBody.empty(); // Xóa nội dung cũ (nếu có)

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
                            <td>${getValue(item.questionLevelName)}</td>
                            <td>${getValue(item.questionCateName)}</td>
                            <td>${getValue(item.CreatedBy)}</td>
                            <td>${getValue(item.ModifyBy)}</td>
                            <td>${formatDate(item.DateCreated)}</td>
                            <td>${formatDate(item.DateModify)}</td>  
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

        const selectedCorrectAnswers = $('input[name="correctAnswer"]:checked')
            .map(function () { return parseInt(this.value); })  // Chuyển giá trị checkbox thành số nguyên
            .get();  // Lấy tất cả các giá trị của các checkbox đã chọn dưới dạng mảng số nguyên

        if (selectedCorrectAnswers.length === 0) {
            alert("Vui lòng chọn ít nhất một đáp án đúng!");
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
            Correct: selectedCorrectAnswers  // Gửi mảng số nguyên
        };
        console.log(newQuestionLevel);
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

                        resetUpdateModal();

                        $("#updateName").val(data.Name || "");
                        $("#updateAnswer1").val(data.Answer1 || "");
                        $("#updateAnswer2").val(data.Answer2 || "");
                        $("#updateAnswer3").val(data.Answer3 || "");
                        $("#updateAnswer4").val(data.Answer4 || "");
                        $("#updateCategory").val(data.QuestionCategoryID || "");
                        $("#updateLevel").val(data.QuestionLevelID || "");

                        // Chuyển chuỗi Correct thành mảng và đánh dấu checkbox tương ứng
                        const correctAnswers = data.Correct.split(",");  // Tách chuỗi thành mảng

                        correctAnswers.forEach(function (correctAnswer) {
                            $(`input[name="updateCorrectAnswer"][value="${correctAnswer}"]`).prop("checked", true);
                        });

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

    // Hàm reset dữ liệu modal cập nhật
    function resetUpdateModal() {
        // Reset các giá trị trong form và checkbox
        $("#updateForm")[0].reset(); // Reset form
        $('input[name="updateCorrectAnswer"]').prop('checked', false); // Bỏ chọn tất cả checkbox
        $("#updateForm").removeData("id");  // Xóa ID câu hỏi đã lưu
    }

    // Xử lý khi submit form "Cập nhật"
    $("#updateForm").on("submit", function (event) {
        event.preventDefault();

        const questionId = $(this).data("id");

        // Lấy tất cả các đáp án đúng được chọn
        const selectedCorrectAnswers = $('input[name="updateCorrectAnswer"]:checked')
            .map(function () { return parseInt(this.value); })  // Chuyển giá trị sang số (nếu cần)
            .get();

        if (selectedCorrectAnswers.length === 0) {
            alert("Vui lòng chọn ít nhất một đáp án đúng!");
            return;
        }

        const updatedQuestion = {
            ID: questionId, 
            Name: CKEDITOR.instances.updateName.getData().trim(), 
            Answer1: $("#updateAnswer1").val().trim(),
            Answer2: $("#updateAnswer2").val().trim(),
            Answer3: $("#updateAnswer3").val().trim(),
            Answer4: $("#updateAnswer4").val().trim(),
            Correct: selectedCorrectAnswers,  // Cập nhật Correct với mảng số
            QuestionCategoryID: $("#updatecategory").val(),
            QuestionLevelID: $("#updatelevel").val()
        };

        console.log(updatedQuestion);

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

    // Hàm import file Excel
    function importExcel() {
        let formData = new FormData();
        let fileInput = $("#fileInput")[0].files[0];

        if (!fileInput) {
            alert("Vui lòng chọn file trước khi upload!");
            return;
        }

        formData.append("file", fileInput);

        $.ajax({
            url: `${apiBaseUrl}/api/Question/import`, // Thay URL này bằng endpoint thực tế
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                $("#message").html('<span class="text-success">Import thành công!</span>');
                alert("Import thành công!");
                $("#importForm")[0].reset();
                fetchData(); // Load lại danh sách câu hỏi sau khi import
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi import:", xhr.responseText);
                $("#message").html('<span class="text-danger">Import thất bại! Kiểm tra lại file.</span>');
                alert("Có lỗi xảy ra khi import.");
            }
        });
    }

    // Bắt sự kiện submit form
    $("#importForm").on("submit", function (event) {
        event.preventDefault(); // Ngăn hành vi submit mặc định
        importExcel();
    });

    function downloadExcelTemplate() {
        // Gọi API để tải file mẫu
        window.location.href = `${apiBaseUrl}/api/Question/download-template`;
    }

    // Gán sự kiện click cho nút "Tải mẫu Excel"
    $("#btnDownloadTemplate").on("click", function () {
        downloadExcelTemplate();
    });

    // Xử lý khi nhấn nút "Xóa"
    $("table").on("click", ".btn-delete", function () {
        const questionId = $(this).data("id");

        if (!confirm("Bạn có chắc chắn muốn xóa không?")) {
            return;
        }

        $.ajax({
            url: `${apiBaseUrl}/api/Question/${questionId}`,
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