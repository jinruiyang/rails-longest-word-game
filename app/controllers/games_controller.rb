require "open-uri"
class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a.sample(10).join
  end

  def score
    @letters = params[:letters]
    @isValidWord = get_api(params[:word])
  end

  def get_api(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    file = open(url).read
    data = JSON.parse(file)
    return data["found"]
  end
end
