# drawacard.rb

# class Card
#   @deck = []
#   suits = %w[ Hearts Diamonds Clubs Spades ]
#   faces = %w[ Ace 2 3 4 5 6 7 8 9 10 Jack Queen King ]
#   suits.each do |suit|
#     suits.each do |face|
#     @deck << "#{face} of #{suit}"
#     end
#   end
#   @deck[rand(52)]
# end
#
# draw_a_card = Card.new
#
# class Game
# end

def player_hit
  puts "you hit"
end

def player_stand
  puts "you stand"
end

def valid_answer
  puts "Please choose a valid option"
end

puts "Let's play Blackjack"
puts "Dealer has a"# + dealer_first_card
puts "and a"# + dealer_second_card
puts "The Dealer's score is:"# + dealer_score
puts "Your first card is"# + player_first_card
puts "Your second card is" #+ player_second_card
puts "Your score is:"# + player_score
puts "Would you like to to Hit (H) or Stand (S) or Quit (Q)"
player_choice = gets.chomp.upcase
if player_choice == "H"
  player_hit
elsif player_choice == "S"
  player_stand
# elsif player_choice == "Q"
#    break
else
  valid_answer
end
