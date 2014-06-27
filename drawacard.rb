# drawacard.rb

class Card

  @deck = []
  suits = %w[ Hearts Diamonds Clubs Spades ]
  faces = %w[ Ace 2 3 4 5 6 7 8 9 10 Jack Queen King ]
  suits.each do |suit|
    suits.each do |face|
    @deck << "#{face} of #{suit}"
    end
  end
  puts @deck[rand(52)]# @card = @deck[rand(52)]
end

draw_a_card = Card.new
