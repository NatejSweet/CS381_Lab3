require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
#require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  < Nathan Sweet >					 	#
#  < sweetn@oregonstate.edu >	       	#
#										#
#########################################

# your code here



def game(rounds)
	currentRound = 1
	validPlayers = false
	puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!", ""
	puts "Please choose two players:"
	puts "(1) StupidBot"
	puts "(2) RandomBot"
	puts "(3) IterativeBot"
	puts "(4) LastPlayBot"
	puts "(5) Human"
	while validPlayers == false
		print "Select player 1:Select player 2:"
		p1 = gets.chomp.to_i
		p2 = gets.chomp.to_i
		if  p1<= 0 || p1 > 5 || p2 <= 0 || p2 > 5
			puts "Invalid Choice(s) - start over"
		else
			validPlayers = true
		end
	end
	p1 = $players[p1-1].call
	p2 = $players[p2-1].call
	puts "#{p1.class.name} vs. #{p2.class.name}"
	while currentRound <= rounds
		puts ""
		puts "Round #{currentRound}:"
		p1Move = p1.play
		p2Move = p2.play
		p1.history.oppenent_plays.push(p2Move)
		p2.history.oppenent_plays.push(p1Move)
		puts "Player 1 chose #{p1Move.class}"
		puts "Player 2 chose #{p2Move.class}"
		result = p1Move.compare_to(p2Move)
		puts result.split(",")[0]
		if result.include?("Win")
			p1.history.add_score
			puts "Player 1 won the Round"
		elsif result.include?("Lose")
			p2.history.add_score
			puts "Player 2 won the Round"
		else
			puts "The Round was a Tie"
		end
		currentRound += 1
	
	end
	puts "Final score is #{p1.history.score} to #{p2.history.score}"
	if p1.history.score > p2.history.score
		puts "Player 1 wins!"
	elsif p1.history.score < p2.history.score
		puts "Player 2 wins!"
	else
		puts "Game was a draw"
end


		



	# your code here
	
end


# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)