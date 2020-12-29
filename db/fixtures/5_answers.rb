ruby_creator_question = Question.find_by(text: 'Кто создал Ruby?')
Answer.seed :text, :question_id,
            { text: 'Matz', question: ruby_creator_question, correct: true },
            { text: 'Бьёрн Страуструп', question: ruby_creator_question },
            { text: 'Юкихиро Мацумото', question: ruby_creator_question, correct: true },
            { text: 'Джеймс Гослинг', question: ruby_creator_question }

ruby_output_question = Question.find_by(text: 'Вывод с переводом строки в Ruby')
Answer.seed :text, :question_id,
            { text: 'put', question: ruby_output_question },
            { text: 'print', question: ruby_output_question },
            { text: 'println', question: ruby_output_question },
            { text: 'puts', question: ruby_output_question, correct: true }

java_creator_question = Question.find_by(text: 'Кто создал Java?')
Answer.seed :text, :question_id,
            { text: 'Гвидо Ван Россум', question: java_creator_question },
            { text: 'Бьёрн Страуструп', question: java_creator_question },
            { text: 'Юкихиро Мацумото', question: java_creator_question },
            { text: 'Джеймс Гослинг', question: java_creator_question, correct: true }

java_output_question = Question.find_by(text: 'Вывод с переводом строки в Java')
Answer.seed :text, :question_id,
            { text: 'System.out.println', question: java_output_question, correct: true },
            { text: 'System.out.print', question: java_output_question },
            { text: 'println', question: java_output_question },
            { text: 'System.println', question: java_output_question }
