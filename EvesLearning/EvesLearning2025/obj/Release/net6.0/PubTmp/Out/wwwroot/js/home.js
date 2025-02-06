// home.js
document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".slide");
    const prevBtn = document.querySelector(".prev-btn");
    const nextBtn = document.querySelector(".next-btn");

    let currentIndex = 0;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove("active");
            if (i === index) {
                slide.classList.add("active");
            }
        });
    }

    prevBtn.addEventListener("click", function () {
        currentIndex = (currentIndex - 1 + slides.length) % slides.length;
        showSlide(currentIndex);
    });

    nextBtn.addEventListener("click", function () {
        currentIndex = (currentIndex + 1) % slides.length;
        showSlide(currentIndex);
    });

    // Hiển thị slide đầu tiên
    showSlide(currentIndex);
});
