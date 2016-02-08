require 'spec_helper'

describe Position do
  describe '#to_s' do
    it "is orientated correctly when rotated" do
      [['N','R','E'],
       ['N','L','W'],
       ['E','R','S'],
       ['E','L','N'],
       ['S','R','W'],
       ['S','L','E'],
       ['W','R','N'],
       ['W','L','S'],
       ['W','LL','E']]
      .each do |start_orientation,movement,end_orientation|
        position = Position.new(['1','1',start_orientation],movement)
        expect(position.to_s).to eq("1 1 #{end_orientation}")
      end

    end
  end
end
