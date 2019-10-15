class Game

  attr_reader :player1, :player2
  attr_accessor :current_player, :number1, :number2, :random

  def initialize
    @player1 = @current_player = Player.new(1)
    @player2 = Player.new(2)
    random_question
  end

  def random_question
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @random = Question.new(@number1, @number2)
  end

  def switch_player(current_player)
    if current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def game_turn
    puts "Player #{current_player.player_number}: What does #{number1} + #{number2} equal?"
    answer = gets.chomp
    @random.validate(answer)
    @current_player.lives += @random.score
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    switch_player(@current_player)
  end

  def transition
    puts "----- NEW TURN -----"
    random_question
  end

  def game_end
    "Player #{@current_player.player_number} wins with a score of #{@current_player.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def play
    loop do 
      game_turn
      if @player1.lives != 0 and @player2.lives != 0
        transition
      end
      break if @player1.lives == 0 or @player2.lives == 0
    end
    game_end
  end

end