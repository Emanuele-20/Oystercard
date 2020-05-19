require 'oyster.rb'

describe Oystercard do
  it 'Test if card responds to balance method' do
    expect(subject).to respond_to(:balance)
  end

  context '#balance' do
    it 'returns default value of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  context 'top_up' do
    it 'subject respond to top_up method' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
    it 'raise error when balance in over 90£' do
      expect { subject.top_up(100) > subject.balance}.to raise_error(RuntimeError)
    end
    it 'return new balance when we add top_up argument' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end


    context 'deduct' do
     xit 'subject respond to deduct method' do
        expect(subject).to respond_to(:deduct).with(1).argument
    end
     xit 'return new balance when we deduct something from it' do
       subject.top_up(4)
       expect{subject.deduct 1}.to change{subject.balance}. by -1
     end

  end

   end

  context 'in_journey?' do
    it 'knows of a card is currently in use' do
      expect(subject).to respond_to(:in_journey?)
    end
  end

  context 'able to touch_in' do
    it 'allows a card to touch in' do
      expect(subject).to respond_to(:touch_in)
    end
    it 'it knows if card is in use' do
      subject.top_up(1)
      expect(subject.touch_in).to eq(true)
    end
    it 'does not allow to touch in if balance less than £1' do
      expect{ subject.touch_in }.to raise_error("please top up card")
    end
  end

  context 'able to touch out' do
    it 'allows a card to touch out' do
      expect(subject).to respond_to(:touch_out)
    end
    it 'it knows if card has been touch_out' do
      card = Oystercard.new
      expect(card.touch_out).to eq(false)
    end
    it 'charge the fair' do
      card = Oystercard.new
      card.top_up(4)
      card.touch_in
      expect { card.touch_out }.to change { card.balance }. by(-Oystercard::FAIR)
  end
  end
  #  Write a test that uses expect {}.to change{}.by() syntax to check that a charge is made on touch out.

  context 'use instance variable to know if your in a journey or not' do
    it 'reads if a card has been touched in or out' do
      expect(subject.instance_variable_get :@injourney).to eq(false)
    end
  end
  context 'knows if the card is in the journey or not' do
    it 'touch in' do
    card = Oystercard.new
    card.top_up(1)
    card.touch_in
      expect(card.in_journey?).to eq(true)
   end
    it 'touch out' do
      card = Oystercard.new
      card.touch_out
        expect(card.in_journey?).to eq(false)
    end
  end

end

#  Write a test that uses expect {}.to change{}.by() syntax to check that a charge is made on touch out.
#  Update the touch_out method to make the test pass
#  Make '#deduct' a private method
#  Keep the code DRY




# =being
#   An error occurred while loading ./spec/oyster_spec.rb.
#   Failure/Error:
#     describe Oystercard do
#     end
#   NameError:
#     uninitialized constant Oystercard
#   # ./spec/oyster_spec.rb:1:in `<top (required)>'
#   No examples found.
# =end
