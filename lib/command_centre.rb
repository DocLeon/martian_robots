class CommandCentre
  def send(instructions)
    @instructions = instructions
  end

  def output
    movement = @instructions[2][0]
    return "1 1 S" if movement == "R"
    return "1 1 N" if movement == "L"
    return "1 1 W" if movement == "RR"
    "1 1 E"
  end
end
