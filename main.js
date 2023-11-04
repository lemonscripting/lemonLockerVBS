function startTimer() {
    var timer = 60; // 60 seconds countdown
    var countdown = setInterval(function () {
        //console.log(timer); // You can replace this with the ID of your timer display element if needed
        timer--;
        if (timer < 0) {
            clearInterval(countdown);
            alert("TIMES UP");
        }
    }, 1000);
}

startTimer();
while (timer > 0){
var currentYear = currentDate.getFullYear();
const correctAnswer = 1922 * 1991 * currentYear
var userAnswer = prompt("Calculate DATA_OF_ESTABLISHMENT_OF_SOVIET_UNION * DISSOLUTION_OF_THE_SOVIET_UNION * CURRENT_YEAR. You have 1 minute to answer:")
if (userAnswer != 7741418146){
    alert("Incorrect answer");
    continue;
} else {
    alert("Lucky for you.");
    return;
}
}