class Player

  attr_reader :player_number
  attr_accessor :lives

  def initialize(player_number)
    @lives = 3
    @player_number = player_number
  end

end