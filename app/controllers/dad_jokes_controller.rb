class DadJokesController < ApplicationController
  require 'httparty'
  
  def home
    response = HTTParty.get('https://icanhazdadjoke.com/', headers: {'Accept' => 'application/json'})
      joke = response['joke']
      render json: { joke: joke }
    end

  end

  