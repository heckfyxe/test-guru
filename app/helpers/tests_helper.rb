module TestsHelper
  def test_level(level)
    case level
    when 0
      t('levels.zero')
    when 1
      t('levels.beginner')
    when 2
      t('levels.medium')
    when 3
      t('levels.advanced')
    when 4
      t('levels.hard')
    else
      t('levels.expert')
    end
  end
end
