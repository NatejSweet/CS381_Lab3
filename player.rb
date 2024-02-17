require_relative 'element'
require_relative 'history'

class Player
    attr_reader :name, :history
    def initialize(name, history)
        @name = name
        @history = history
    end

    def play
        fail "This method should be overridden"
    end
end

class RandomBot < Player
    def play
        move = moves.sample
        @history.plays.push(move)
        return move
    end
end

class StupidBot < Player
    def play
        @history.plays.push($moves[0])
        return $moves[0]
    end

end

class LastPlayBot < Player
    def play
        if @history.oppenent_plays.empty?
            move = $moves[0]
        else
            move = @history.oppenent_plays.last
            @history.plays.push(move)
        end
        return move
    end
end

class IterativeBot < Player
    def initialize(name,history)
        super(name, history)
        @move = 0
    end
    def play
        move = $moves[@move]
        @history.plays.push(move)
        @move += 1
        if @move == 5
            @move = 0
        end
        return move
    end
end

class Human < Player
    def play 
        puts "(1) Rock"
        puts "(2) Paper"
        puts "(3) Scissors"
        puts "(4) Lizard" 
        puts "(5) Spock"
        print "Enter your move: "
        move = (gets.chomp.to_i) -1
        if move >= 0 && move <= 4
            @history.plays.push($moves[move])
            return $moves[move]
        else
            puts "Invalid move - try again"
            play
        end
    end
end

$players = [
    lambda { StupidBot.new("StupidBot", History.new) },
    lambda { RandomBot.new("RandonBot", History.new) },
    lambda { IterativeBot.new("IterativeBot", History.new) },
    lambda { LastPlayBot.new("LastPlayBot", History.new) },
    lambda { Human.new("Human", History.new) }
]

