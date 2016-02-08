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
    it "from 1 1 it moves forward in orientation when instructed" do
      [['N','1 2 N'],
       ['S','1 0 S'],
       ['W','0 1 W'],
       ['E','2 1 E']]
      .each do |start_orientation,final_position|
        position = Position.new(['1','1',start_orientation],'F')
        expect(position.to_s).to eq(final_position)
      end

    end
    it "from 1 1 it moves forward and rotates when instructed" do
      position = Position.new(['1','1','N'],'RF')
      expect(position.to_s).to eq('2 1 E')
    end
  end
end
