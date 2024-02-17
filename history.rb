class History 
    attr_accessor :plays, :oppenent_plays, :score
    def initialize
        @plays = Array.new
        @oppenent_plays = Array.new
        @score = 0
    end

    def log_play(play)
        @plays.push(play)
    end

    def log_opponent_play(play)
        @oppenent_plays.push(play)
    end

    def add_score()
        @score +=1
    end
end

