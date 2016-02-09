require 'spec_helper'

describe CommandCentre do
  subject(:command_centre) { CommandCentre.new }

  describe '#send' do
    context '1 robot in fleet' do
      context 'no commands' do
        it  'reports back position of robot' do
          command_centre.send(["5 3","1 1 E",""])
          expect(command_centre.output).to eq([["1 1 E"]])
        end
        context 'receives R command' do
          it 'reports back robot is facing south' do
            command_centre.send(["5 3","1 1 E","R"])
            expect(command_centre.output).to eq([["1 1 S"]])
          end
        end
        context 'receives L command' do
          it 'reports back robot is facing north' do
            command_centre.send(["5 3","1 1 E","L"])
            expect(command_centre.output).to eq([["1 1 N"]])
          end
        end
        context 'receives LR command' do
          it 'reports back robot is facing east' do
            command_centre.send(["5 3","1 1 E","LR"])
            expect(command_centre.output).to eq([["1 1 E"]])
          end
        end
        context 'receives RR command' do
          it 'reports back robot is facing west' do
            command_centre.send(["5 3","1 1 E","RR"])
            expect(command_centre.output).to eq([["1 1 W"]])
          end
        end
        context 'F command it moves off grid' do
          it 'reports back robot is LOST' do
            command_centre.send(["1 1","1 1 E","F"])
            expect(command_centre.output).to eq([["1 1 E LOST"]])
          end
        end
      end
      context 'many robots in fleet' do
        it 'reports back for many robots' do
          command_centre.send(["5 3","1 1 E","LR","1 1 E","LR"])
          expect(command_centre.output.count).to eq(2)
        end
      end
    end
  end

end
