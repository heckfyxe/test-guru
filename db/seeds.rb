# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.find_or_create_by!([{ first_name: 'Иван', last_name: 'Соловьёв' },
                                 { first_name: 'Игорь', last_name: 'Воронов' },
                                 { first_name: 'Егор', last_name: 'Безруков' },
                                 { first_name: 'Гарри', last_name: 'Поттер' }])

categories = Category.find_or_create_by!([{ title: 'Ruby' }, { title: 'Java' }])

tests = Test.find_or_create_by!([{ title: 'Ruby для начинающих', level: 0, category_id: categories.first.id },
                                 { title: 'Java для начинающих', level: 0, category_id: categories.last.id }])

questions = Question.find_or_create_by!([{ text: 'Вывод с переводом строки', test_id: tests.first.id },
                                         { text: 'Вывод с переводом строки', test_id: tests.last.id }])

qid1 = questions.first.id
qid2 = questions.last.id
Answer.find_or_create_by!([{ text: 'put', question_id: qid1 },
                           { text: 'print', question_id: qid1 },
                           { text: 'println', question_id: qid1 },
                           { text: 'puts', correct: true, question_id: qid1 },
                           { text: 'System.out.println', correct: true, question_id: qid2 },
                           { text: 'System.out.print', question_id: qid2 },
                           { text: 'println', question_id: qid2 },
                           { text: 'System.println', question_id: qid2 }])

users.each do |user|
  tests.each do |test|
    TestingHistory.find_or_create_by!(user_id: user.id, test_id: test.id, completed: (user.id + test.id).even?)
  end
end
