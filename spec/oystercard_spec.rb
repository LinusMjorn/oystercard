require 'oystercard.rb'

describe Oystercard do

  let(:oyster) {Oystercard.new}

  it  "checks that the balance of oyster card is equal to the defualt" do
  expect(oyster.balance).to eq (15)
  end

  it "checks that you can top up the card with a specific value" do
  expect {oyster.top_up(10)}.to change{oyster.balance}.by 10
  end

  it "sends an error message if the card is topped up with more than £90" do
    expect {oyster.top_up(76)}.to raise_error "Limit is £90"
  end

  it "checks that you can deduct money from  the balance" do
    expect {oyster.deduct(10)}.to change{oyster.balance}.by -10
  end

  describe 'touch_in' do
    it "checks that the oyster card has been touched in" do
      oyster.touch_in
      expect(oyster.in_journey).to eq true
    end

    it 'won\'t allow me to touch in if the balance is less than £1' do
      oyster.deduct(15)
      expect { oyster.touch_in }.to raise_error "Minimum fare is £1"
    end
  end

  describe 'touch out' do
    it "checks that the oyster card gas been touched out" do
      oyster.touch_in
      oyster.touch_out
      expect(oyster.in_journey).to eq false
    end
  end

  describe 'in_journey?' do
    it "checks whether the card is in use or not" do
      oyster.touch_in
      expect(oyster.in_journey?).to be_truthy
    end

    it "checks whether the card is in use or not" do
      oyster.touch_out
      expect(oyster.in_journey?).to be_falsey
    end
  end
end
