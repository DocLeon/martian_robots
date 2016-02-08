require 'spec_helper'

describe CommandCentre do
  subject(:command_centre) { CommandCentre.new }

  describe '#send' do
    context '1 robot in fleet, no commands' do
      context 'no commands' do
        it  'reports back position of robot' do
          command_centre.send([["5 3"],["1 1 E"],[""]])
          expect(command_centre.output).to eq([["1 1 E"]])
        end
      end

    end

    context '1 robot in fleet, receives R command' do
      it 'reports back robot is facing south' do
        command_centre.send([["5 3"],["1 1 E"],["R"]])
        expect(command_centre.output).to eq([["1 1 S"]])
      end
    end

    context '1 robot in fleet, receives L command' do
      it 'reports back robot is facing north' do
        command_centre.send([["5 3"],["1 1 E"],["L"]])
        expect(command_centre.output).to eq([["1 1 N"]])
      end
    end

    context '1 robot in fleet, receives LR command' do
      it 'reports back robot is facing east' do
        command_centre.send([["5 3"],["1 1 E"],["LR"]])
        expect(command_centre.output).to eq([["1 1 E"]])
      end
    end

    context '1 robot in fleet, receives RR command' do
      it 'reports back robot is facing west' do
        command_centre.send([["5 3"],["1 1 E"],["RR"]])
        expect(command_centre.output).to eq([["1 1 W"]])
      end
    end
  end

end
