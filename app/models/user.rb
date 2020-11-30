class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN testing_histories ON tests.id = testing_histories.test_id').where('testing_histories.user_id': id, level: level)
  end
end
