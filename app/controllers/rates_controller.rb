require 'kconv'
require 'csv'

class RatesController < ApplicationController

  def to_csv
    csv_str = CSV.generate do |csv|
      csv_column_names = %w(id name score)
      csv << csv_column_names
      @results.each do |result|
        element = @elements.find(result.elements_id)
        csv_column_values = [
          result.elements_id,
          element.name,
          result.score
        ]
        csv << csv_column_values
      end
    end

    NKF::nkf('--sjis -Lw', csv_str)
  end

  def index
    @genre = Genre.find(params[:genre_id])
    @theme = Theme.find(params[:theme_id])
    @results = Result.where(themes_id:params[:theme_id],genre_id:params[:genre_id])
    @elements = Element.all
    @ranks = @results.order("score DESC")
    respond_to do |format|
      format.html
      format.csv { send_data to_csv, filename: "#{@theme.title}.csv"}
    end
  end

  def show
    @genre = Genre.find(params[:genre_id])
    @theme = Theme.find(params[:theme_id])
    @results = Result.where(themes_id:params[:theme_id],genre_id:params[:genre_id])
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
    redirect_to :action => "show"
  end

  private
  def update_params
    params.permit(:score)
  end

end
