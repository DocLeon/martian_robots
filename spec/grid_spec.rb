require 'spec_helper'

describe Grid do
  describe '#is_not_scented?' do
    it 'initializes whole grid to not scented' do
      grid = Grid.new(0,0)
      expect(grid.is_not_scented?([0,0])).to eq(true)
    end
  end
  describe '#mark' do
    it 'scents position' do
      grid = Grid.new(1,1)
      grid.mark([1,1])
      expect(grid.is_not_scented?([1,1])).to eq(false)
    end
  end
end
