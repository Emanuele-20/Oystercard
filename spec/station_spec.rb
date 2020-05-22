require 'station'

describe 'Station' do
  # it "check if station is a new instance of Station" do
  #     expect(Station.new("name", 2)).to be_an_instance_of Station
  #   end

  it 'check if Station.new responds to instance variable' do
    expect(Station.new("name", 2).zone).to eq(2)
  end

  it "check if Station.new responds to instance variable " do
    expect(Station.new("Bank", 1).name).to eq("Bank")
  end




  end
