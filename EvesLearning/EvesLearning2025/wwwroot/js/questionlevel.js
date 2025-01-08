document.addEventListener("DOMContentLoaded", function () {
    function fetchData() {
        fetch("https://localhost:7118/api/Question/GetAllQuestionLevel", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                const tableBody = document.querySelector("table tbody"); // Chọn `tbody` của bảng

                tableBody.innerHTML = ""; // Xóa nội dung cũ (nếu có)
                console.log(data);
                // Duyệt qua từng phần tử trong dữ liệu và thêm hàng vào bảng
                data.forEach(item => {
                    const row = document.createElement("tr");

                    const getValue = (value) => value === null || value === undefined ? "" : value;

                    row.innerHTML = `
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
                `;
                    tableBody.appendChild(row);
                });
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi lấy dữ liệu từ server. Vui lòng thử lại!");
            });
    }

    fetchData();

    const addNewForm = document.getElementById("addNewForm"); // Đảm bảo lấy đúng form

    // Xử lý sự kiện khi form được submit
    addNewForm.addEventListener("submit", function (event) {
        event.preventDefault(); // Ngừng gửi form mặc định

        const newQuestionLevel = {
            Name: document.getElementById("name").value.trim() // Lấy giá trị Name từ input
        };

        // Kiểm tra nếu Name trống thì không gửi yêu cầu
        if (!newQuestionLevel.Name) {
            alert("Tên không được để trống!");
            return;
        }

        // Gửi dữ liệu tới API
        fetch("https://localhost:7118/api/Question/QuestionLevel", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(newQuestionLevel) // Dữ liệu JSON
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                console.log("New Question Level added:", data);
                alert("Thêm mới thành công!");

                fetchData();

                // Đóng modal
                // Đảm bảo modal đóng tự động sau khi thành công
                const modalElement = document.getElementById("addNewLevel");
                const modal = bootstrap.Modal.getInstance(modalElement); // Lấy đối tượng modal hiện tại
                modal.hide(); // Đóng modal

                // Reset form sau khi thêm thành công
                addNewForm.reset();
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi thêm mới.");
            });
    });
});
