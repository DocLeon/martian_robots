require 'spec_helper'

describe RobotPosition do
  describe '#move' do
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
        position = RobotPosition.new(['1','1',start_orientation],Grid.new(5,3))
        position.move(movement)
        expect(position.to_s).to eq("1 1 #{end_orientation}")
      end
    end
    it "from 1 1 it moves forward in orientation when instructed" do
      [['N','1 2 N'],
       ['S','1 0 S'],
       ['W','0 1 W'],
       ['E','2 1 E']]
      .each do |start_orientation,final_position|
        position = RobotPosition.new(['1','1',start_orientation],Grid.new(5,3))
        position.move('F')
        expect(position.to_s).to eq(final_position)
      end

    end
    it "from 1 1 it moves forward and rotates when instructed" do
      position = RobotPosition.new(['1','1','N'],Grid.new(5,3))
      position.move('RF')
      expect(position.to_s).to eq('2 1 E')
    end
    it "moves south off 0 0 robot is lost" do
      position = RobotPosition.new(['0','0','S'],Grid.new(5,3))
      position.move('F')
      expect(position.to_s).to eq('0 0 S LOST')
    end
    it "moves west off 0 0 robot is lost" do
      position = RobotPosition.new(['0','0','W'],Grid.new(5,3))
      position.move('F')
      expect(position.to_s).to eq('0 0 W LOST')
    end
    context "small 1 1 grid" do
      it "from 1 1 it moves forward and is lost" do
        position = RobotPosition.new(['1','1','N'],Grid.new(1,1))
        position.move('F')
        expect(position.to_s).to eq('1 1 N LOST')
      end
      it "marks scent when lost" do
        grid = double()
        allow(grid).to receive(:max_x) {1}
        allow(grid).to receive(:max_y) {1}
        allow(grid).to receive(:is_not_scented?) {true}
        expect(grid).to receive(:mark).with([1,1])
        position = RobotPosition.new(['1','1','N'],grid)
        position.move('F')
      end
      it "checks for scent before getting lost" do
        grid = double()
        allow(grid).to receive(:max_x) {1}
        allow(grid).to receive(:max_y) {1}
        expect(grid).to receive(:is_not_scented?).with([1,1])
        position = RobotPosition.new(['1','1','N'],grid)
        position.move('F')
      end
    end
  end
end
