class TextsController < ApplicationController
  def index
  end

  def show
    render partial: "studies/#{params[:name]+params[:id]}"
  end
end
