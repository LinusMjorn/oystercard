require 'oystercard.rb'

describe Oystercard do

  it  "checks that the balance of oyster card is equal to the defualt" do

   oyster = Oystercard.new

  expect(oyster.balance).to eq (15)


end

  end
