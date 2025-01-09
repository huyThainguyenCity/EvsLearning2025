document.addEventListener("DOMContentLoaded", function () {
    function fetchData() {
        fetch("https://localhost:7118/api/Question/GetAllQuestion", {
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
                const tableBody = document.querySelector("table tbody");

                tableBody.innerHTML = ""; 
                console.log(data);
                data.forEach(item => {
                    const row = document.createElement("tr");

                    const getValue = (value) => value === null || value === undefined ? "" : value;

                    row.innerHTML = `
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

    const addNewForm = document.getElementById("addNewForm"); 

    addNewForm.addEventListener("submit", function (event) {
        event.preventDefault(); 

        const newQuestionLevel = {
            Name: document.getElementById("name").value.trim(), 
            Answer1: document.getElementById("answer1").value.trim(), 
            Answer2: document.getElementById("answer2").value.trim(), 
            Answer3: document.getElementById("answer3").value.trim(), 
            Answer4: document.getElementById("answer4").value.trim(),
            Correct: document.getElementById("correct").value.trim()
        };

        if (!newQuestionLevel.Name) {
            alert("Tên không được để trống!");
            return;
        }

        fetch("https://localhost:7118/api/Question", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(newQuestionLevel) 
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

                const modalElement = document.getElementById("addNewLevel");
                const modal = bootstrap.Modal.getInstance(modalElement); 
                modal.hide(); 

                addNewForm.reset();
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi thêm mới.");
            });
    });
});
