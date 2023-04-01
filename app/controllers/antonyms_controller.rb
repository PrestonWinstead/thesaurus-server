class AntonymsController < ApplicationController
  def index
    puts "in antonyms controller #{params}"
    render json: AntonymService.new(params[:search]).find_antonymss
  end
end
