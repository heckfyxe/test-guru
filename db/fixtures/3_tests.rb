Test.seed :title, :level, :category_id, :author_id,
          { title: 'Ruby для начинающих', level: 0, category_id: Category.find_by(title: 'Ruby').id, author_id: User.first.id },
          { title: 'Java для начинающих', level: 0, category_id: Category.find_by(title: 'Java').id, author_id: User.first.id }
