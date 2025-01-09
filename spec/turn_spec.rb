require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn1 = Turn.new("Juneau", card)

    @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn2 = Turn.new("Saturn", card)
  end
  

  describe '#initialize' do
    it 'exists' do
      expect(@turn1).to be_instance_of(Turn)
      expect(@turn2).to be_instance_of(Turn)
    end
  
    it 'has a guess' do
      expect(@turn1.guess).to eq("Juneau")
      expect(@turn2.guess).to eq("Saturn")
    end

    it 'has a card' do
      expect(@turn1.card).to eq(@card1)
      expect(@turn2.card).to eq(@card2)
    end
  end

  describe '#correct?' do
    it 'accurately evaluates guess as true' do
      expect(@turn1.correct?).to eq(true)
    end

    it 'accurately evaluates guess as false' do
      expect(@turn2.correct?).to eq(false)
    end
  end

  describe '#feedback' do
    it 'provides phrase based on correct? returning true' do
      expect(@turn1.feedback).to eq("Correct!")
    end

    it 'provides phrase based on correct? returning false or nil' do
      expect(@turn2.feedback).to eq("Incorrect.")
    end
  end
end
