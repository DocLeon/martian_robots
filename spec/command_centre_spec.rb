require 'spec_helper'

describe CommandCentre do
  context '1 robot in fleet, no commands' do
    it  'reports back position of robot' do
      @command_centre = CommandCentre.new
      @command_centre.send([["5 3"],["1 1 E"],[""]])
      expect(@command_centre.output).to eq("1 1 E")
    end
  end

  context '1 robot in fleet, receives R command' do
    it 'reports back robot is facing south' do
      @command_centre = CommandCentre.new
      @command_centre.send([["5 3"],["1 1 E"],["R"]])
      expect(@command_centre.output).to eq("1 1 S")
    end
  end
end
