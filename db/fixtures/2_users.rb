require 'devise'
require 'bcrypt'

def digest(klass, password)
  password = "#{password}#{klass.pepper}" if klass.pepper.present?
  ::BCrypt::Password.create(password, cost: klass.stretches).to_s
end

password_digest = digest(User, 'password')
confirmed_at = Time.current

User.seed :email,
          { email: 'ivan@mail.com', encrypted_password: password_digest, confirmed_at: confirmed_at, type: 'Admin' },
          { email: 'igor@mail.com', encrypted_password: password_digest, confirmed_at: confirmed_at },
          { email: 'egor@mail.com', encrypted_password: password_digest, confirmed_at: confirmed_at },
          { email: 'harry@mail.com', encrypted_password: password_digest, confirmed_at: confirmed_at }
