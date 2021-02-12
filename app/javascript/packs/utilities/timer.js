document.addEventListener('turbolinks:load', () => {
    let endAt = document.querySelector("#test_passage_end_at")
    if (endAt == null || endAt.textContent === 'no_timer')
        return

    let countDownDate = new Date(parseInt(endAt.textContent)).getTime()

    function timerAct() {
        let now = new Date();

        if (now > countDownDate) {
            clearInterval(timer)
            document.querySelector('input[type="submit"]').click()
            return true
        }

        let leftDate = new Date(countDownDate - now)
        let hours = leftDate.getUTCHours().toString().padStart(2, '0')
        let minutes = leftDate.getUTCMinutes().toString().padStart(2, '0')
        let seconds = leftDate.getUTCSeconds().toString().padStart(2, '0')

        document.querySelector('#testing_timer').textContent = hours + ':' + minutes + ':' + seconds
    }

    if (timerAct()) return

    let timer = setInterval(timerAct, 1000)
})
