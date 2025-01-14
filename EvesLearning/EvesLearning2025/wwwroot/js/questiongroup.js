﻿$(document).ready(function () {
    function fetchData() {
        $.ajax({
            url: "https://localhost:7118/api/Question/GetAllQuestionGroup",
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
            Description: $("#description").val().trim(),
            Reference: $("#reference").val().trim()
        };

        if (!newQuestionLevel.Name) {
            alert("Tên không được để trống!");
            return;
        }

        $.ajax({
            url: "https://localhost:7118/api/Question/QuestionGroup",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(newQuestionLevel),
            success: function (data) {
                console.log("New Question Group added:", data);
                alert("Thêm mới thành công!");

                fetchData();

                const modalElement = $("#addNewGroup");
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
