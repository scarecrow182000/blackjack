# blackjack.rb

class Deck

  @deck = []
  suits = %w[ ♤ ♧ ♡ ♢ ]
  faces = %w[ Ace 2 3 4 5 6 7 8 9 10 Jack Queen King ]
  suits.each do |suit|
    faces.each do |face|
    deck << "#{face} of #{suit}"
    end
  end
end

class Hand
  attr_accessor :hand, :score

  def initialize
    @hand = hand
    @score = score
  end
end

class Player < Hand
    super
@player_hand = []

  def initial_hand
    @player_hand <<  @deck.pop
    @player_hand << @deck.pop
  end



end

class Dealer < Hand
end

deck.new
player.new

@deck.shuffle!
puts "Let's Play Blackjack!"
puts "===Shuffling Deck===="
puts "====Dealing Cards===="
puts "Your hand is" + @player_hand[0] + " " + @player_hand[1]

# puts "Your hand is" + @player_hand
# puts "Your score is:" + @player_score
# puts "Dealer hand is:" + @dealer_hand
# puts "Dealer score:" + @dealer_score
