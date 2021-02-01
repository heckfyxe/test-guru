class SessionsController < Devise::SessionsController
  def create
    super
    flash[:alert] = "Привет, #{current_user.first_name}!" if current_user && current_user.sign_in_count == 1
  end
end
