class TextsController < ApplicationController
  def index
  end

  def study
    @time_table = Multiplication.order("RAND()").limit(3)
    render partial: "studies/#{params[:name]+params[:id]}" and return
  end
  
end
