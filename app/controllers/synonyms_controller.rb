class SynonymsController < ApplicationController
  def index
    puts "in synonyms controller #{params}"
    render json: SynonymService.new(params[:search]).find_synonyms
  end
end
