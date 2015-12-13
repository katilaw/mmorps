class Game
  attr_reader :player, :player_points, :computer, :computer_points
  def initialize
    @player = "Player"
    @comupter = "Computer"
    @player_points = 0
    @computer_points = 0
    @rps = ["Rock", "Paper", "Scissors"]
  end

  def self.run(input)
    unless player_points == 2 || computer_points == 2
      comp = rps.sample


    end
    # conditional here
  end
end




player submits
saves input in @hand_choice
# This comes from outside class
computer picks random
compatre player to computer
determine winner
add point to winner
