class Admin
  class BadgesController < Admin::BaseController
    before_action :find_badge, except: %i[index new create]

    def index
      @badges = Badge.all
    end

    def new
      @badge = Badge.new
    end

    def create
      @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to admin_badges_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if @badge.update(badge_params)
        redirect_to admin_badges_path
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy
      redirect_to admin_badges_path
    end

    private

    def badge_params
      params.require(:badge).permit(:title, :image_url, :badge_type, :option)
    end

    def find_badge
      @badge = Badge.find(params[:id])
    end
  end
end
