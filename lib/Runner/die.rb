module Runner
  class Die
  attr_reader :number

    def initialize
      roll
    end

    def roll
      @number = rand(1..6)
    end

    if __FILE__ == $PROGRAM_NAME
      dice = Die.new
      puts dice.roll
      puts dice.roll
      puts dice.roll
    end
  end
end
