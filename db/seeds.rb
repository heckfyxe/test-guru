# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
return if User.exists?

users = User.create!([{ first_name: 'Иван', last_name: 'Соловьёв' },
                      { first_name: 'Игорь', last_name: 'Воронов' },
                      { first_name: 'Егор', last_name: 'Безруков' },
                      { first_name: 'Гарри', last_name: 'Поттер' }])

categories = Category.create!([{ title: 'Ruby' }, { title: 'Java' }])

tests = Test.create!([{ title: 'Ruby для начинающих', level: 0, category: categories.first, author: users.first },
                      { title: 'Java для начинающих', level: 0, category: categories.last, author: users.first }])

questions = Question.create!([{ text: 'Вывод с переводом строки', test: tests.first },
                              { text: 'Вывод с переводом строки', test: tests.last }])

first_q = questions.first
last_q = questions.last
Answer.create!([{ text: 'put', question: first_q },
                { text: 'print', question: first_q },
                { text: 'println', question: first_q },
                { text: 'puts', correct: true, question: first_q },
                { text: 'System.out.println', correct: true, question: last_q },
                { text: 'System.out.print', question: last_q },
                { text: 'println', question: last_q },
                { text: 'System.println', question: last_q }])

users.each do |user|
  tests.each do |test|
    TestingHistory.create!(user: user, test: test, completed: (user.id + test.id).even?)
  end
end
