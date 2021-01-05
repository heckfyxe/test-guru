class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to target_path
    else
      flash.now[:alert] = 'Проверьте ваш email и пароль!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def target_path
    cookies[:path] || tests_path
  end
end