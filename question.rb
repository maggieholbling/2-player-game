class Question

  attr_reader :answer, :score

  def initialize(number1, number2)
    @answer = number1 + number2
    @score = 0
  end
  
  def validate(player_answer)
    if player_answer.to_i == @answer
      puts "YES! You are correct."
      @score = 0
    else
      puts "Seriously? No!"
      @score = -1
    end
  end

end