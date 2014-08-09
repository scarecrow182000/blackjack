require 'pry'

class Card
  attr_accessor :suit, :face, :value

  def initialize suit, face, value
    @suit = suit
    @face = face
    @value = value
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []

    %w[ ♤ ♧ ♡ ♢ ].each do |suit|
      [2, 3, 4, 5, 6, 7, 8, 9, 10].each do |face|
        value = face
        @cards << Card.new(suit, face, value)
      end
    end

    %w[ ♤ ♧ ♡ ♢ ].each do |suit|
      {"J"=>10, "Q"=>10, "K"=>10, "A"=> 11}.each do |face, value|
        @cards << Card.new(suit, face, value)
      end
    end

    @cards = shuffle_deck
  end

  def shuffle_deck
    @cards.shuffle
  end

  # def deal_card(r)
  #   r << @cards.shift
  # end
end

Deck.new
binding.pry

class Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def display
    [@face,@suit].join("")
  end

  def value
    cards.map(&:value).inject(:+)
  end

  # def take_card(card)
  #   @cards << card
  # end
end

class Game
  attr_accessor :player_hand, :dealer_hand, :deck


  @deck = Deck.new
  @deck.shuffle
  @player_hand = Hand.new
  @dealer_hand = Hand.new

  @player_hand << @deck.shift
  @dealer_hand << @deck.shift
  @player_hand << @deck.shift
  @dealer_hand << @deck.shift


  def play_again?
    puts "Would you like to play another hand of BlackJack? Yes (Y) or No (N)"
    again = gets.chomp.upcase
    if again == "Y" then Game.new
    elsif again == "N" then abort
    elsif puts "Please enter a 'Y' or 'N'" then play_again?
    end
  end

  def determine_winner
    if @dealer_score > @player_score then puts "Sorry you lose. Would you like to play again?" && play_again?
    elsif @player_score > @dealer_score then puts "You win Would you like to play again?" && play_again?
    elsif @deal_score = @player_score then puts "Game is a draw. Would you like to play again?" && play_again?
    end
  end

  def player_busted
    puts "Sorry You have busted. Your score is more than 21. Would you like to play again?"
    play_again?
  end

  def hit_dealer
    @dealer_hand << @deck.shift
    play_dealer
  end

  def play_dealer
    puts "Dealer Hand is: " "#{@dealer_hand.display}" + "For a score of " + "#{@dealer_hand.value}"
    if @dealer_hand.value > 21 then puts "Congratulations you win!" && play_again?
    elsif @dealer_hand.value < 16 then puts "Dealer hits!" && hit_dealer
    elsif @dealer_hand.value > 16 then determine_winner
    end
  end

  def hit_player
    @player_hand << @deck.shift
    play_player
  end

  def play_player
    puts "Your Hand is: " + "#{@player_hand.display}" + "For a score of " + "#{@player_hand.value}"
    if @player_score > 21 then player_busted
    end
    puts "Do you want to Hit (H) or Stand (S)?"
    ans = gets.chomp.upcase
    if ans == "H" then hit_player
    elsif ans == "S" then play_dealer
    elsif puts "Please choose 'H' or 'S' " then play_player
    end
  end


  puts "Welcome to Blackjack."
  puts "Dealer Hand is: " + @dealer_hand.display
  puts "With a score of: " "#{@dealer_hand.value}"

  if @player_hand.value == 21 then puts "Winner, Winner, Chicken Dinner! You Have Black Jack!" && play_again?
  elsif @dealer_hand.value == 21 then puts "Dealer has Blackjack! You lose!" && play_again?
  else play_player
  end
end

Game.new
# (╯°□°）╯︵ ┻━┻
