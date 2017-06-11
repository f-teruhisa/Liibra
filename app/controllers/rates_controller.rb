class RatesController < ApplicationController

  def index
    @theme = Theme.find(params[:theme_id])
    @results = Result.where(themes_id:params[:theme_id])
    @elements = Element.all
    @ranks = @results.order("score DESC")
  end

  def show
    @theme = Theme.find(params[:theme_id])
    @results = Result.where(themes_id:params[:theme_id])
    @result = @results.order("RAND()").limit(2)
    @elements = Element.all
    sum = 0
    @result.each do |result|
      @element = @elements.find(result.elements_id)
      # スコア計算をするため、２つの候補のスコアの和を求めsumとする
      sum += result.score
    end
    @sum = sum
  end

  def new
  end

  def update
    # submitボタンからhidden_field_tagの値を送り、更新
    result = Result.find(params[:result_id])
    result.update(update_params)
  end

  private
  def update_params
    params.permit(:score)
  end

end
