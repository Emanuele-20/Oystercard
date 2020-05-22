require 'oyster'

describe Journey do

  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

  subject { Journey.new(entry_station) }

  it 'to hold entry station when initialized' do
    expect(subject.entry_station).to eq(entry_station)
  end

  it 'complete is false if just touched in' do
  expect(subject.complete?).to eq(false)
 end

 it 'complete is true if just touched out' do
   subject.end_journey(exit_station)
   expect(subject.complete?).to eq(true)
 end

 it 'if no entry and exit station, return PENALTY_FARE' do
   expect(subject.calculate_fare).to eq(Journey::PENALTY_FARE)
 end

 it 'returns MINIMUM_FARE if entry & exit station' do
   subject.end_journey(exit_station)
   expect(subject.calculate_fare).to eq(Journey::FARE)
 end


end
