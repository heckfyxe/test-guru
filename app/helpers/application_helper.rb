module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end

module ActiveSupport
  class TimeWithZone
    def in_milliseconds
      (to_f * 1000).to_i
    end
  end
end
