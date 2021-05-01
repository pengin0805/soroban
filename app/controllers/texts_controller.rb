class TextsController < ApplicationController
  def index
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
    render partial: "studies/#{params[:name]+params[:id]}" and return
  end
  
end
