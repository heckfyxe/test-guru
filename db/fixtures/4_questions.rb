ruby_test = Test.find_by(title: 'Ruby для начинающих')
Question.seed :text, :test_id,
              { text: 'Кто создал Ruby?', test_id: ruby_test.id },
              { text: 'Вывод с переводом строки в Ruby', test_id: ruby_test.id }

java_test = Test.find_by(title: 'Java для начинающих')
Question.seed :text, :test_id,
              { text: 'Кто создал Java?', test_id: java_test.id },
              { text: 'Вывод с переводом строки в Java', test_id: java_test.id }
