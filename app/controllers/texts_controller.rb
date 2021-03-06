class TextsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :move_to_show, only: :study
  before_action :search_product, only: [:index, :search]

  def index
    @texts = Text.all
    @today = Date.today
    from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    to_date = Date.new(@today.year, @today.month, @today.end_of_month.day)
    @calendar_data = from_date.upto(to_date)
  end

  def study
    @today = Date.today
    from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    to_date = Date.new(@today.year, @today.month, @today.end_of_month.day)
    @calendar_data = from_date.upto(to_date)
    @time_table = Multiplication.order("RAND()").limit(3)
    render partial: "studies/#{params[:name]+params[:id]}" 
  end

  def search
    @results = @p.result.all
  end

  private

  def move_to_show
    unless current_user.premium
      redirect_to user_path
    end
  end

  def search_product
    @p = Text.ransack(params[:q])
  end
  

end
