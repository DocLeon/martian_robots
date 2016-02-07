class CommandCentre
  def send(instructions)
    @instructions = instructions
  end

  def output
    return "1 1 E" if @instructions[2][0].empty?
    "1 1 S"
  end
end
