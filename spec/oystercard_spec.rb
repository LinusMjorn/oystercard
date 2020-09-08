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


  end
