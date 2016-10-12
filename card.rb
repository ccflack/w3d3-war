class Card

include Comparable

  attr_accessor :suit, :face, :value

  def initialize(suit, face)
    self.suit = suit
    self.face = face
    self.value = self.class.faces.index(face)+1
  end

  def self.suits
    %w(spades clubs hearts diamonds)
  end

  def self.faces
    faces = ("2".."10").to_a
    faces.push("Jack", "Queen", "King", "Ace")
    faces
  end

  def <=>(other)
    value <=> other.value
  end

end
