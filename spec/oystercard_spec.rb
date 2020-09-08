require 'oystercard.rb'

describe Oystercard do

  it  "checks that the balance of oyster card is equal to the defualt" do

   oyster = Oystercard.new

  expect(oyster.balance).to eq (15)
  end

  it "checks that you can top up the card with a specific value" do

  oyster = Oystercard.new

  expect {oyster.top_up(10)}.to change{oyster.balance}.by 10
  end

  it "sends an error message if the card is topped up with more than £90" do

    oyster = Oystercard.new

    expect {oyster.top_up(76)}.to raise_error "Limit is £90"
  end

  it "checks that you can deduct money from  the balance" do
    oyster = Oystercard.new

    expect {oyster.deduct(10)}.to change{oyster.balance}.by -10
  end

  describe 'touch_in' do
    it "checks that the oyster card has been touched in" do
      oyster = Oystercard.new
      oyster.touch_in
      expect(oyster.in_journey).to eq true
    end
  end

  describe 'touch out' do
    it "checks that the oyster card gas been touched out" do
      oyster = Oystercard.new
      oyster.touch_in
      oyster.touch_out
      expect(oyster.in_journey).to eq false
    end
  end

  describe 'in_journey?' do
    it "checks whether the card is in use or not" do
      oyster = Oystercard.new
      oyster.touch_in
      expect(oyster.in_journey?).to be_truthy
    end
    it "checks whether the card is in use or not" do
      oyster = Oystercard.new
      oyster.touch_out
      expect(oyster.in_journey?).to be_falsey
    end
  end

  end
