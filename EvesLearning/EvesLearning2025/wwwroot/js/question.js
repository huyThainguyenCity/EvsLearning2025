$(document).ready(function () {
    let questionData = [];

    // Fetch data từ API
    function fetchData() {
        $.ajax({
            url: "https://localhost:7118/api/Question/GetAllQuestion",
            type: "POST",
            contentType: "application/json",
            success: function (data) {
                questionData = data; // Lưu dữ liệu vào questionData

                const quizContainer = document.getElementById("quizContainer");

                if (!quizContainer) {
                    console.error("Không tìm thấy phần tử quizContainer.");
                    return;
                }

                quizContainer.innerHTML = ""; // Xóa nội dung cũ

                // Duyệt qua từng câu hỏi và thêm câu hỏi và đáp án vào quiz
                data.forEach((question, index) => {
                    const questionDiv = document.createElement("div");
                    questionDiv.classList.add("question");
                    questionDiv.id = `question${index + 1}`;

                    // Tạo tiêu đề câu hỏi
                    const questionTitle = document.createElement("h3");
                    questionTitle.innerHTML = `${index + 1}. ${question.Name}`;
                    questionDiv.appendChild(questionTitle);

                    // Tạo các lựa chọn câu trả lời
                    const optionsDiv = document.createElement("div");
                    optionsDiv.classList.add("options");

                    const answers = [question.Answer1, question.Answer2, question.Answer3, question.Answer4];
                    answers.forEach((answer, optionIndex) => {
                        const label = document.createElement("label");
                        const input = document.createElement("input");
                        input.type = "radio";
                        input.name = `question${index + 1}`;  // Đảm bảo mỗi câu hỏi có nhóm radio riêng
                        input.value = optionIndex + 1; // Đặt giá trị radio là 1, 2, 3, 4
                        label.appendChild(input);
                        label.appendChild(document.createTextNode(answer));
                        optionsDiv.appendChild(label);
                    });

                    questionDiv.appendChild(optionsDiv);
                    quizContainer.appendChild(questionDiv);
                });

                // Thêm nút submit
                const submitButton = document.createElement("button");
                submitButton.classList.add("submit-btn");
                submitButton.textContent = "Submit";
                quizContainer.appendChild(submitButton);

                submitButton.addEventListener("click", submitQuiz); // Thêm sự kiện click cho nút submit
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi lấy dữ liệu từ server. Vui lòng thử lại!");
            }
        });
    }


    fetchData(); // Gọi hàm fetchData để lấy dữ liệu khi trang web tải xong

    let timer; // Biến đếm ngược toàn cục

    function startTimer(duration) {
        const timerElement = document.getElementById("timer");
        let remainingTime = duration; // Thời gian còn lại tính bằng giây

        function updateTimerDisplay() {
            const minutes = Math.floor(remainingTime / 60).toString().padStart(2, "0");
            const seconds = (remainingTime % 60).toString().padStart(2, "0");
            timerElement.textContent = `Thời gian còn lại: ${minutes}:${seconds}`; // Định dạng luôn là mm:ss
        }

        const interval = setInterval(() => {
            updateTimerDisplay();
            if (remainingTime <= 0) {
                clearInterval(interval);
                timerElement.textContent = "Hết thời gian!";
                timerElement.style.color = "white";  // Đổi màu thành đỏ khi hết giờ
                shakeTimer();  // Thêm hiệu ứng rung
                alert("Hết thời gian!");
                submitQuiz(); // Gọi hàm tự động nộp bài
            }
            remainingTime--;
        }, 1000);

        // Hiển thị lần đầu tiên khi bắt đầu
        updateTimerDisplay();
    }

    // Thêm hiệu ứng rung cho đồng hồ khi hết thời gian
    function shakeTimer() {
        const timerElement = document.getElementById("timer");
        timerElement.classList.add("shake");
        setTimeout(() => {
            timerElement.classList.remove("shake");
        }, 500); // Rung trong 0.5 giây
    }


    let isSubmitted = false;  // Cờ kiểm tra đã nộp chưa

    function submitQuiz() {
        if (isSubmitted) {
            alert("Bạn đã nộp bài rồi!");
            return;
        }

        isSubmitted = true;  // Đánh dấu là đã nộp bài
        // Lấy tất cả câu hỏi và câu trả lời đã chọn
        const questions = document.querySelectorAll(".question");
        const userAnswers = [];

        questions.forEach((question, index) => {
            const selectedAnswer = question.querySelector(`input[name="question${index + 1}"]:checked`);
            if (selectedAnswer) {
                const userAnswer = {
                    QuestionId: questionData[index].ID, // ID câu hỏi từ dữ liệu API
                    SelectedAnswer: selectedAnswer.value, // Đáp án người dùng chọn
                };
                userAnswers.push(userAnswer);
            }
        });

        // Gửi câu trả lời của người dùng tới API để kiểm tra
        $.ajax({
            url: "https://localhost:7118/api/Question/GetCheckQuestion",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(userAnswers), // Chuyển đổi dữ liệu người dùng thành JSON
            success: function (data) {
                // Xử lý kết quả trả về từ API
                data.forEach((result, index) => {
                    // Tìm câu hỏi dựa trên ID
                    const questionDiv = document.getElementById(`question${index + 1}`);
                    if (questionDiv) {
                        // Tạo phần tử để hiển thị kết quả
                        const resultDiv = document.createElement("div");
                        resultDiv.classList.add("result");

                        // Hiển thị "Đúng" hoặc "Sai" cùng với đáp án đúng
                        if (result.isCorrect) {
                            resultDiv.textContent = `Đúng!`;
                            resultDiv.style.color = "green";  // Màu xanh cho đáp án đúng
                        } else {
                            resultDiv.textContent = `Sai! Đáp án đúng là: ${result.correctAnswer}`;
                            resultDiv.style.color = "red";  // Màu đỏ cho đáp án sai
                        }

                        // Thêm phần tử kết quả vào câu hỏi
                        questionDiv.appendChild(resultDiv);
                    }
                });
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi gửi câu trả lời.");
            }
        });
    }

    startTimer(60);
});
