document.addEventListener('turbolinks:load', () => {
    let endAt = document.querySelector("#test_passage_end_at")
    if (endAt == null || endAt.textContent === 'no_timer')
        return

    let countDownDate = new Date(parseInt(endAt.textContent)).getTime()

    function timerAct() {
        let now = new Date().getTime();
        let timeLeft = countDownDate - now;
        console.log(timeLeft)

        if (timeLeft < 0) {
            clearInterval(timer)
            document.querySelector('input[type="submit"]').click()
            return true
        }

        let hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        let minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
        let seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);

        hours = hours.toString().padStart(2, '0')
        minutes = minutes.toString().padStart(2, '0')
        seconds = seconds.toString().padStart(2, '0')

        document.querySelector('#testing_timer').textContent = hours + ':' + minutes + ':' + seconds
    }

    if (timerAct()) return

    let timer = setInterval(timerAct, 1000)
})
