ruby_test = Test.find_by(title: 'Ruby для начинающих')
Question.seed :text, :test_id,
              { text: 'Кто создал Ruby?', test: ruby_test },
              { text: 'Вывод с переводом строки в Ruby', test: ruby_test }

java_test = Test.find_by(title: 'Java для начинающих')
Question.seed :text, :test_id,
              { text: 'Кто создал Java?', test: java_test },
              { text: 'Вывод с переводом строки в Java', test: java_test }
