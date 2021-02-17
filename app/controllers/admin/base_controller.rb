class Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :admin_required!

    private

    def admin_required!
      redirect_to root_path, alert: t('admin.no_access') unless current_user.is_a?(Admin)
    end
  end
end
