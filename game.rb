require ('./cards.rb')
class Game
	def initialize
		@cards= Cards.new
		@score=0
		@records= []
		@finish=false
	end


	def score_check
		puts "\n Your score is now #{@score}"
	end

	def play
		if @score > -2 && @cards.draw != "NO MORE CARDS"
			player= @cards.draw
			puts "\n Player has drawn #{player}"
			opp = @cards.draw
			puts "\n Opponent has drawn #{opp}"

			if player>opp
				@score+=1
				puts "Player has won this round"

			else 
				@score -=1
				puts "Opponent has won this round"

			end
			@records.push ([player,opp])

			score_check
		else
			puts "\n Sorry you have lost!"

		end

		puts "\n Current Records: #{@records}"


	end

	def end_game
		@finish=true
		puts "\n Thank you for playing the game! Your game score is  #{@score}"
		puts "~~~~~~~~~End of Game~~~~~~~~~~~~~~~"
	end

	def start 
		while @score > -2 && @cards.draw!= "No MORE CARDS" && @finish==false
			playing= ""
			if @records.length == 0 
				loop do 
					puts "Will you like to start the game (y/n)"
					playing=gets.chomp
					break if playing.upcase="Y" || playing.upcase="N"
					end
				end

			else 
				loop do 
					puts "Do you want to continue playing the game (y/n)"
					playing= gets.chomp
					break if playing.upcase= "Y" || playing.upcase="N"
					end
				end
			


			if playing.upcase = "Y"
				play

			else

				@finish=true

			end

		end

		end_game
	end

end

game=Game.new
game.start

end

