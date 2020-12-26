Answer.seed :id,
            { id: 1, text: 'put', question_id: 1 },
            { id: 2, text: 'print', question_id: 1 },
            { id: 3, text: 'println', question_id: 1 },
            { id: 4, text: 'puts', question_id: 1, correct: true }

Answer.seed :id,
            { id: 5, text: 'Matz', question_id: 2, correct: true },
            { id: 6, text: 'Бьёрн Страуструп', question_id: 2 },
            { id: 7, text: 'Юкихиро Мацумото', question_id: 2, correct: true },
            { id: 8, text: 'Джеймс Гослинг', question_id: 2 }

Answer.seed :id,
            { id: 9, text: 'Гвидо Ван Россум', question_id: 3 },
            { id: 10, text: 'Бьёрн Страуструп', question_id: 3 },
            { id: 11, text: 'Юкихиро Мацумото', question_id: 3 },
            { id: 12, text: 'Джеймс Гослинг', question_id: 3, correct: true }

Answer.seed :id,
            { id: 13, text: 'System.out.println', question_id: 4, correct: true },
            { id: 14, text: 'System.out.print', question_id: 4 },
            { id: 15, text: 'println', question_id: 4 },
            { id: 16, text: 'System.println', question_id: 4 }
