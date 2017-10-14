class LikesController < ApplicationController
  before_action :set_theme

  # Like
  def create
    @like = Like.create(user_id: current_user.id, theme_id: params[:theme_id])
    @likes = Like.where(theme_id: params[:theme_id])
    @theme = Theme.find(params[:theme_id])
  end

  # Unlike
  def destroy
    like = Like.find_by(user_id: current_user.id, theme_id: params[:theme_id])
    like.destroy
    @likes = Like.where(theme_id: params[:theme_id])
    @theme = Theme.find(params[:theme_id])
  end

  private

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end

end
