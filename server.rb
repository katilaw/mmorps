require "sinatra"
require "pry"
# require_relative "app/models/rps"

set :views, File.join(File.dirname(__FILE__), "app/views")

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get '/game' do
  if session[:player_points].nil?
    session[:player_points] = 0
    session[:computer_points] = 0
  end
  if session[:player_points] == 2
    @winner = "Human"
  end
  if session[:computer_points] == 2
    @winner = "Computer"
  end
  erb :index
end


post '/game' do
  @player_choice = params[:choice]
  @computer_choice = ["Rock", "Paper", "Scissors"].sample
  @winner = ""

  if @player_choice == @computer_choice
    session[:player_points] += 0
    session[:computer_points] += 0
    session[:round_msg] = "This round was a tie. Play again!"
  elsif (@player_choice == "Rock" && @computer_choice == "Scissors" ) || (@player_choice == "Paper" && @computer_choice == "Rock") || (@player_choice == "Scissors" && @computer_choice == "Paper")
    session[:player_points] += 1
    session[:round_msg] = "Player won this round!"
  else
    session[:computer_points] += 1
    session[:round_msg] = "Computer won this round."
  end

  redirect "/game"
end

post '/game/results' do
  session.clear
  redirect '/game'
end
