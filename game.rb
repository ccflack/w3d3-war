require_relative "card"
require_relative "deck"

class War

  attr_accessor :attila_deck,
                :alexander_deck,
                :attila_hand,
                :alexander_hand,
                :attila_wins,
                :alexander_wins,
                :ties

  def initialize
    self.attila_deck = Deck.new
    self.alexander_deck = Deck.new
    self.attila_wins = 0
    self.alexander_wins = 0
    self.ties = 0
  end

  def play
    attila_deck.shuffle!
    alexander_deck.shuffle!
    until (attila_deck || alexander_deck).empty?
      players_draw
      winner
    end
    output
    rematch?
  end

  def players_draw
    self.attila_hand = attila_deck.draw
    self.alexander_hand = alexander_deck.draw
  end

  def winner
    if attila_hand > alexander_hand
      self.attila_wins += 1
    elsif attila_hand < alexander_hand
      self.alexander_wins += 1
    else
      self.ties += 1
    end
  end

  def output
    if attila_wins.to_i > alexander_wins.to_i
      puts "Atillia won this game after #{attila_wins} rounds and survived #{ties} WARs."
    elsif attila_wins.to_i < alexander_wins.to_i
      puts "Alexander won this game after #{alexander_wins} rounds and survived #{ties} WARs."
    else
      puts "The armies are have reached a stalemate."
    end
  end

  def rematch?
    print "Would you like a rematch (y/n)?"
    response = gets.chomp
    if response == "y"
      initialize
      play
    else
      puts "Thanks for playing!"
      exit
    end
  end
end

war = War.new
war.play
