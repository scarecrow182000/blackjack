
class Card

@deck = []
suits = %w[ ♤ ♧ ♡ ♢ ]
faces = %w[ Ace 2 3 4 5 6 7 8 9 10 Jack Queen King ]

suits.each do |suit|
  faces.each do |face|
  @deck << "#{face} of #{suit}"
  end

end

class 
