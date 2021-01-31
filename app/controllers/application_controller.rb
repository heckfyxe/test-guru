class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a? Admin
        admin_tests_path
      else
        tests_path
      end
  end
end
