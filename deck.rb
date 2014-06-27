# deck.rb
# class Card

deck = []
suits = %w[ ♤ ♧ ♡ ♢ ]
faces = %w[ Ace 2 3 4 5 6 7 8 9 10 Jack Queen King ]
suits.each do |suit|
  faces.each do |face|
  deck << "#{face} of #{suit}"
  end
end
# end

# class Player (:hand, :score)
# end
#
# class Dealer (:hand, :score)
# end
#
# class Game

  deck.shuffle!
  puts "Let's Play Blackjack!"
  puts "=====Shuffling====="
  puts "======Dealing======"
  puts "The Dealer's first card is a " + deck.shift
  puts "The Dealer's second card is a " + deck.shift
  puts "The Player's first card is a " + deck.shift
  puts "the Player's second card is a " + deck.shift
