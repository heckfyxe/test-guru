class BadgesController < ApplicationController
  def index
    @earned_badges = current_user.badges
    @other_badges = Badge.where.not(id: @earned_badges.ids)
  end
end
