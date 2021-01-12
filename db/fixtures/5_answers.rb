ruby_creator_question = Question.find_by(text: 'Кто создал Ruby?')
Answer.seed :text, :question_id,
            { text: 'Matz', question_id: ruby_creator_question.id, correct: true },
            { text: 'Бьёрн Страуструп', question_id: ruby_creator_question.id },
            { text: 'Юкихиро Мацумото', question_id: ruby_creator_question.id, correct: true },
            { text: 'Джеймс Гослинг', question_id: ruby_creator_question.id }

ruby_output_question = Question.find_by(text: 'Вывод с переводом строки в Ruby')
Answer.seed :text, :question_id,
            { text: 'put', question_id: ruby_output_question.id },
            { text: 'print', question_id: ruby_output_question.id },
            { text: 'println', question_id: ruby_output_question.id },
            { text: 'puts', question_id: ruby_output_question.id, correct: true }

java_creator_question = Question.find_by(text: 'Кто создал Java?')
Answer.seed :text, :question_id,
            { text: 'Гвидо Ван Россум', question_id: java_creator_question.id },
            { text: 'Бьёрн Страуструп', question_id: java_creator_question.id },
            { text: 'Юкихиро Мацумото', question_id: java_creator_question.id },
            { text: 'Джеймс Гослинг', question_id: java_creator_question.id, correct: true }

java_output_question = Question.find_by(text: 'Вывод с переводом строки в Java')
Answer.seed :text, :question_id,
            { text: 'System.out.println', question_id: java_output_question.id, correct: true },
            { text: 'System.out.print', question_id: java_output_question.id },
            { text: 'println', question_id: java_output_question.id },
            { text: 'System.println', question_id: java_output_question.id }
