class TextsController < ApplicationController
  def index
  end

  def study
    @time_table = TimeTable.all
    render partial: "studies/#{params[:name]+params[:id]}" and return
  end
  
end
