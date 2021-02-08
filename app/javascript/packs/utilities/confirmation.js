document.addEventListener('turbolinks:load', () => {
    let confirmation_input = document.querySelector('#user_password_confirmation')
    if (!confirmation_input) return

    confirmation_input.addEventListener('input', (e) => {
        let rightIcon = e.target.parentNode.querySelector('.octicon-check-circle')
        let wrongIcon = e.target.parentNode.querySelector('.octicon-x-circle-fill')
        let confirmation = e.target.value
        if (!confirmation) {
            rightIcon.classList.add('hide')
            wrongIcon.classList.add('hide')
            return
        }

        let password = document.querySelector('#user_password').value
        if (confirmation === password) {
            rightIcon.classList.remove('hide')
            wrongIcon.classList.add('hide')
        } else {
            wrongIcon.classList.remove('hide')
            rightIcon.classList.add('hide')
        }
    })
})