class SessionsController < Devise::SessionsController
  def create
    super
    flash[:alert] = t(:welcome, current_user.first_name)
  end
end
