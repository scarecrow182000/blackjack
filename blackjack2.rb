# blackjack2.rb
require 'pry'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
      %w[ ♤ ♧ ♡ ♢ ].each do |suit|
        %w[A 2 3 4 5 6 7 8 9 10 J Q K ].each do |face|
          @cards << [suit, face].join(" ")
      end
    end
    @cards.shuffle!
  end

  def deal_card
    @cards.shift
  end

end

class Hand
  # attr_accessor :hand

  def initialize
    @hand = []
  end

  def take_card(card)
    @hand << card
  end

  def value(f)
    if f == "A" then value = 11
    elsif f == %w[J Q K].any? then value = 10
    else value == face.to_i
    end
    return value
  end
end

class Blackjack
  attr_accessor :deck, :player_hand, :dealer_hand

  @player_hand = Hand.new
  @dealer_hand = Hand.new
  @deck = Deck.new

  def play_again?
    puts "Would you like to play another hand of BlackJack? Yes (Y) or No (N)"
    again = gets.chomp.upcase
    if again == "Y" then Game.new
    elsif again == "N" then puts "Goodbye" && abort
    else puts "Please enter a 'Y' or 'N'" then play_again?
    end
  end

  def determine_winner
    if score(@dealer_hand) > score(@player_hand) then puts "Sorry you lose. Would you like to play again?" && play_again?
    elsif score(@player_hand) > score(@dealer_hand) then puts "You win Would you like to play again?" && play_again?
    elsif score(@dealer_hand) = score(@player_hand) then puts "Game is a draw. Would you like to play again?" && play_again?
    end
  end

  def player_busted
    puts "Sorry You have busted. Your score is more than 21. Would you like to play again?"
    play_again?
  end

  def score(h)
    s = []
    h.each.split.first.send Hand.value f
    s << value
    score = s.inject(:+)
    return score
  end

  def deal_card(hand:)
    hand.take_card(deck.deal_card)
  end

  def play_dealer
    puts "Dealer Hand is: #{@dealer_hand} For a score of " + "#{@dealer_hand.value}"
    if score(@dealer_hand) > 21 then puts "Congratulations you win!" && play_again?
    elsif score(@dealer_hand) < 16 then deal_card(hand:@dealer_hand) && puts "Dealer hits!"
    elsif score(@dealer_hand) > 16 then determine_winner
    end
  end

  def play_player
    puts "Your Hand is: " + "#{@player_hand.display}" + "For a score of " + "#{@player_hand.value}"
    if score(@player_hand) > 21 then player_busted
    end
    puts "Do you want to Hit (H) or Stand (S)?"
    ans = gets.chomp.upcase
    if ans == "H" then deal_card(hand:@player_hand)
    elsif ans == "S" then play_dealer
    elsif puts "Please choose 'H' or 'S' " then play_player
    end
  end

  def start_game
    puts "Welcome to the table. Ready to play BlackJack? Dealing Cards."

    2.times do deal_card(hand:@player_hand)
    2.times do deal_card(hand:@dealer_hand)

    puts "The dealers cards are: #{@dealer_hand}"#"with a score of: #{score(@dealer_hand)}"
    puts "Your cards are: #{@player_hand}"#"with a score of: #{score(@player_hand)}"
    if score(@dealer_hand) == 21 then puts "Dealer has Blackjack! Sorry you lose" && play_again?
    elsif score(@player_hand) == 21 then puts "Winner, Winner, Chicken Dinner! You Have Black Jack!" && play_again?
    else puts "" && play_player
    end
  end

end

bj = Blackjack.new
bj.start_game
