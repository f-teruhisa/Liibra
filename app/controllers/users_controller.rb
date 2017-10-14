class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(create_params)
  end

  def show
    @user = User.find(params[:id])
    # @current_user ||= User.find_by(id: session[:user_id])
    @themes = Theme.where(user_id: params[:id]).order('updated_at DESC').page(params[:page]).per(5)
    @genre = Genre.all
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy if user.id == current_user.id
    redirect_to root_path
  end

  private
  def update_params
    params.require(:user).permit(:name, :avatar, :information)
  end

  def create_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end
end
