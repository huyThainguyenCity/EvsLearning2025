$(document).ready(function () {
    var examId = sessionStorage.getItem("examId"); // Lấy lại examId đã lưu trước đó

    // Fetch data từ API
    function fetchData() {
        $.ajax({
            url: `${apiBaseUrl}/api/Exam/GetAllQuestionOfExam`,
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ id: examId }),
            success: function (data) {
                questionData = data; // Lưu dữ liệu vào questionData
                const quizContainer = document.getElementById("quizContainer");

                if (!quizContainer) {
                    console.error("Không tìm thấy phần tử quizContainer.");
                    return;
                }
                quizContainer.innerHTML = ""; // Xóa nội dung cũ
                console.log(data);
                // Lấy thời gian làm bài từ API (giả sử `FullTime` là số phút)
                const fullTimeInMinutes = data.length > 0 ? data[0].FullTime || 30 : 30; // Nếu không có, đặt mặc định là 30 phút
                const fullTimeInSeconds = fullTimeInMinutes * 60;

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
                        input.type = "checkbox";
                        input.name = `question${index + 1}`;  // Đảm bảo mỗi câu hỏi có nhóm checkbox  riêng
                        input.value = optionIndex + 1; // Đặt giá trị checkbox  là 1, 2, 3, 4
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
                startTimer(fullTimeInSeconds);
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
        const examResults = [];

        questions.forEach((question, index) => {
            const selectedAnswers = Array.from(question.querySelectorAll(`input[name="question${index + 1}"]:checked`))
                .map(input => input.value); // Lấy tất cả các giá trị đã chọn

            if (selectedAnswers.length > 0) {
                const userAnswer = {
                    QuestionId: questionData[index].ID, // ID câu hỏi từ dữ liệu API
                    SelectedAnswer: selectedAnswers.join(","), // Gửi danh sách đáp án dưới dạng chuỗi "2,3"
                };
                userAnswers.push(userAnswer);

                const examResult = {
                    examID: examId, // ID bài thi
                    questionCategoryID: questionData[index].QuestionCategoryID, // ID danh mục
                    questionID: questionData[index].ID, // ID câu hỏi
                    userChoice: selectedAnswers.join(","), // Đáp án đã chọn
                    correct: "", // Sẽ cập nhật sau khi có kết quả từ API
                    totalScore: 100
                }
                examResults.push(examResult);
            }
        });

        // Gửi câu trả lời của người dùng tới API để kiểm tra
        $.ajax({
            url: `${apiBaseUrl}/api/Question/GetCheckQuestion`,
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(userAnswers),
            success: function (data) {
                console.log(data);

                data.forEach((result, index) => {
                    console.log(result);
                    const questionDiv = document.getElementById(`question${index + 1}`);
                    if (questionDiv) {
                        const resultDiv = document.createElement("div");
                        resultDiv.classList.add("result");

                        if (result.isCorrect) {
                            resultDiv.textContent = `Đúng!`;
                            resultDiv.style.color = "green";
                        } else {
                            resultDiv.textContent = `Sai! Đáp án đúng là: ${result.correctAnswer}`;
                            resultDiv.style.color = "red";
                        }

                        questionDiv.appendChild(resultDiv);
                    }

                    // Cập nhật danh sách examResults
                    const matchingExamResult = examResults.find(exam => exam.questionID === result.questionId);
                    if (matchingExamResult) {
                        matchingExamResult.correct = result.correctAnswer;
                    }
                });

                console.log("examResults sau khi cập nhật:", examResults);

                // Gửi request thứ hai sau khi cập nhật examResults
                $.ajax({
                    url: `${apiBaseUrl}/api/Exam/ExamResult`,
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(examResults),
                    success: function () {
                        console.log("Dữ liệu đã gửi lên API AddExamResult.");
                        alert("Bài thi đã được lưu!");
                    },
                    error: function (xhr, status, error) {
                        console.error("Lỗi khi gửi kết quả bài thi:", error);
                        alert("Có lỗi xảy ra khi gửi kết quả bài thi!");
                    }
                });

            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi gửi câu trả lời.");
            }
        });
    }

//    startTimer(60);
});
