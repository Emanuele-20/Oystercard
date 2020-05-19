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
      it 'subject respond to deduct method' do
        expect(subject).to respond_to(:deduct).with(1).argument
    end
     it 'return new balance when we deduct something from it' do
       subject.top_up(4)
       expect{subject.deduct 1}.to change{subject.balance}. by -1
     end

  end

end

end



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
