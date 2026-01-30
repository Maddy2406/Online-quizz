function startTimer(duration, display) {
    let timer = duration, minutes, seconds;
    let interval = setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            clearInterval(interval);
            alert("Time's up! Submitting quiz automatically.");
            document.getElementById("quizForm").submit();
        }
    }, 1000);
}

document.addEventListener("DOMContentLoaded", function() {
    const timeDisplay = document.querySelector('#time');
    if (timeDisplay) {
        // Default 10 minutes for quiz
        startTimer(60 * 10, timeDisplay);
    }
});

function validateForm() {
    // Add custom validation if needed
    return true;
}
