class BadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @current_test_passages = @user.test_passages.where(test: @test)
    @badges = Badge.where.not(id: @user.badges.ids)
  end

  def new_earned_badges
    @badges.select do |badge|
      send("#{badge.badge_type}?", badge.option)
    end
  end

  private

  def first_time?(_params)
    @current_test_passages.count == 1 if @test_passage.success?
  end

  def category?(category_id)
    return false unless @test.category.id == category_id.to_i

    test_ids = Category.find(category_id.to_i).tests.ids
    test_ids.size == count_tests_success(test_ids)
  end

  def level?(level)
    return false unless @test.level == level.to_i

    test_ids = Test.where(level: level).ids
    test_ids.size == count_tests_success(test_ids)
  end

  def count_tests_success(test_ids)
    @user.test_passages.where(test_id: test_ids).success.uniq.count
  end
end
