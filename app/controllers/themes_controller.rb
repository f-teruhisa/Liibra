class ThemesController < ApplicationController
    before_action :authenticate_user!
  def index
  end

  def new
    @theme = Theme.new
  end

  def create
    Theme.create(create_params)
    redirect_to action: index and return
  end

  def show
    @themes = Theme.all.order('updated_at DESC')
  end

  def serch
  end

  private
  def create_params
    params.require(:theme).permit(:title, :information, :image_url).merge(user_id: current_user.id)
  end
end
