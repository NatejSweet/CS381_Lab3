class Element
    attr_accessor :name

    def initialize(name="")
        @name = name
    end

    def compare_to
        fail "This method should be overridden"
    end
end

class Rock < Element
    def compare_to(other)
      if other.is_a?(Lizard)
        return "Rock crushes Lizard, Win"
      elsif other.is_a?(Spock)
        return "Spock vaporizes Rock, Lose"
      elsif other.is_a?(Rock)
        return "Rock equals Rock, Tie"
      elsif other.is_a?(Scissors)
        return "Rock crushes Scissors, Win"
      elsif other.is_a?(Paper)
        return "Paper covers Rock, Lose"
      else
        fail "Invalid element"
      end
    end
  end

class Scissors < Element
    def compare_to(other)
        if other.class == Lizard
            return "Scissors decapitate Lizard, Win"
        elsif other.class == Spock
            return "Spock smashes Scissors, Lose"
        elsif other.class == Rock
            return "Rock crushes Scissors, Lose"
        elsif other.class == Scissors
            return "Scissors equals Scissors, Tie"
        elsif other.class == Paper
            return "Scissors cut Paper, Win"
        else
            fail "Invalid element"
        end
    end
end

class Paper < Element
    def compare_to(other)
        if other.class == Lizard
            return "Lizard eats Paper, Lose"
        elsif other.class == Spock
            return "Paper disproves Spock, Win"
        elsif other.class == Rock
            return "Paper covers Rock, Win"
        elsif other.class == Scissors
            return "Scissors cut Paper, Lose"
        elsif other.class == Paper
            return "Paper equals Paper, Tie"
        else
            fail "Invalid element"
        end
    end
end

class Spock < Element
    def compare_to(other)
        if other.class == Lizard
            return "Lizard poisons Spock, Lose"
        elsif other.class == Spock
            return "Spock equals Spock, Tie"
        elsif other.class == Rock
            return "Spock vaporizes Rock, Win"
        elsif other.class == Scissors
            return "Spock smashes Scissors, Win"
        elsif other.class == Paper
            return "Paper disproves Spock, Lose"
        else
            fail "Invalid element"
        end
    end
end

class Lizard < Element
    def compare_to(other)
        if other.is_a?(Lizard)
            return "Lizard equals Lizard, Tie"
        elsif other.is_a?(Spock)
            return "Lizard poisons Spock, Win"
        elsif other.is_a?(Rock)
            return "Rock crushes Lizard, Lose"
        elsif other.is_a?(Scissors)
            return "Scissors decapitate Lizard, Lose"
        elsif other.is_a?(Paper)
            return "Lizard eats Paper, Win"
        else
            fail "Invalid element"
        end
    end
end


$moves = [Rock.new, Paper.new, Scissors.new, Lizard.new, Spock.new]