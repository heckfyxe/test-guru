Test.seed :title, :level, :category_id, :author_id,
          { title: 'Ruby для начинающих', level: 0, category: Category.find_by(title: 'Ruby'), author: User.first },
          { title: 'Java для начинающих', level: 0, category: Category.find_by(title: 'Java'), author: User.first }
