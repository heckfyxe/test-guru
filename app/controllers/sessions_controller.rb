class SessionsController < Devise::SessionsController
  def create
    super
    flash[:alert] = "Привет, #{current_user.first_name}!"
  end
end
