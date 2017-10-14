class ThemesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def index
    @genre = Genre.find(params[:genre_id])
    @theme = Theme.all
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.create(create_theme_params)
    @elements = Element.where('genre_id LIKE(?)', "#{params[:genre_id]}")
    # 各themeのスコア表resultsを作る
    @elements.each do |ele|
      @result = Result.new
      @result.elements_id = ele.id
      @result.themes_id = @theme.id
      @result.genre_id = params[:genre_id]
      @result.score = 1500
      @result.save
    end
    redirect_to :action => "index"
  end

  def show
    @genre = Genre.find(params[:genre_id])
    @themes = Theme.where('genre_id LIKE(?)', "#{params[:genre_id]}").order('updated_at DESC').page(params[:page]).per(5)
  end

  def search
    @genre = Genre.find(params[:genre_id])
    @themes = Theme.where('genre_id LIKE(?)', "#{params[:genre_id]}").where('title LIKE(?)', "%#{params[:keyword]}%").order('updated_at DESC').page(params[:page]).per(5)
  end

  def destroy
    theme = Theme.find(params[:id])
    theme.destroy if theme.user_id.to_i == current_user.id
    redirect_to :action => "show"
  end

  private
  def create_theme_params
    params.require(:theme).permit(:title, :information, :image_url).merge(user_id: current_user.id, genre_id: params[:genre_id])
  end

end
