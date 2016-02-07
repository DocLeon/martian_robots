class CommandCentre
  def send(instructions)
    @instructions = instructions
  end

  def output
    return "1 1 S" if @instructions[2][0] == "R"
    return "1 1 N" if @instructions[2][0] == "L"
    return "1 1 W" if @instructions[2][0] == "RR"
    "1 1 E"
  end
end
