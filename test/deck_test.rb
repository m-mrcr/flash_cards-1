require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < MiniTest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_can_have_cards
    assert_equal @deck.cards, @cards
  end

  def test_it_can_show_card_count
    assert_equal @deck.count, 3
  end

  def test_it_can_show_cards_in_specific_category
    assert_equal @deck.cards_in_category(:STEM), [@card_2, @card_3]
    assert_equal @deck.cards_in_category(:Geography), [@card_1]
    assert_equal @deck.cards_in_category("Pop Culture"), []
  end

end
