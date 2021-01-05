cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
password_digest = BCrypt::Password.create('password', cost: cost)

User.seed :email,
          { first_name: 'Иван', last_name: 'Соловьёв', email: 'ivan@mail.com', password_digest: password_digest },
          { first_name: 'Игорь', last_name: 'Воронов', email: 'igor@mail.com', password_digest: password_digest },
          { first_name: 'Егор', last_name: 'Безруков', email: 'egor@mail.com', password_digest: password_digest },
          { first_name: 'Гарри', last_name: 'Поттер', email: 'harry@mail.com', password_digest: password_digest }
