require 'Position'

class CommandCentre
  def send(instructions_sent)
    start_position = instructions_sent[1][0].split(' ')
    movements = instructions_sent[2][0]
    @final_position = Position.from(start_position,movements)
  end

  def output
    "#{@final_position}"
  end

end
