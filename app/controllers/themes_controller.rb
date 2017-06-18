class ThemesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def index
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.create(create_theme_params)
    @elements = Element.all
    # themeごとのスコア表resultsを作る
    @elements.each do |ele|
      @result = Result.new
      @result.elements_id = ele.id
      @result.themes_id = @theme.id
      @result.score = 1500
      @result.save
    end
    redirect_to action: index and return
  end

  def show
    @themes = Theme.all.order('updated_at DESC').page(params[:page]).per(6)
  end

  def search
    @themes = Theme.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(6)
  end

  def destroy
    theme = Theme.find(params[:id])
    theme.destroy if theme.user_id == current_user.id
    redirect_to action: index and return
  end

  private
  def create_theme_params
    params.require(:theme).permit(:title, :information, :image_url).merge(user_id: current_user.id)
  end

end
