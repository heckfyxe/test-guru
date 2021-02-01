require 'devise'
require 'bcrypt'

def digest(klass, password)
  password = "#{password}#{klass.pepper}" if klass.pepper.present?
  ::BCrypt::Password.create(password, cost: klass.stretches).to_s
end

password_digest = digest(User, 'password')
confirmed_at = Time.current

User.seed :email,
          { first_name: 'Иван', last_name: 'Соловьёв', email: 'ivan@mail.com', encrypted_password: password_digest,
            confirmed_at: confirmed_at, sign_in_count: 1, type: 'Admin' },
          { first_name: 'Игорь', last_name: 'Воронов', email: 'igor@mail.com', encrypted_password: password_digest,
            confirmed_at: confirmed_at, sign_in_count: 1 },
          { first_name: 'Егор', last_name: 'Безруков', email: 'egor@mail.com', encrypted_password: password_digest,
            confirmed_at: confirmed_at, sign_in_count: 1 },
          { first_name: 'Гарри', last_name: 'Поттер', email: 'harry@mail.com', encrypted_password: password_digest,
            confirmed_at: confirmed_at, sign_in_count: 1 }
