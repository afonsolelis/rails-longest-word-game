class GamesController < ApplicationController
  def new
    range = ('a'..'z').to_a
    @letters = range.sample(5).join
  end

  def score
    @word = params[:word]
    @result = english_word?(@word)
  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    doc = open(url)
    @response = JSON.parse(doc.read)
    @response
  end
end
