class RatesController < ApplicationController

  def index

  end

  def show

  end

  def create
    Rate.create(create_params)
  end

  private
  def create_params
    params.require(:question).permit(:text).merge(user_id: current_user.id, group_id: current_user.group_id)
  end

end
