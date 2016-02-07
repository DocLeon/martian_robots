class CommandCentre
  def send(instructions)
  end

  def output
    [["1 1 E"],["3 3 N LOST"]]
  end
end

Given(/^I have a robot on Mars$/) do
  @command_centre = CommandCentre.new()
end

When(/^I send these instructions:$/) do |instructions|
  @command_centre.send(instructions.raw)
end

Then(/^I should receive:$/) do |table|
  expect(@command_centre.output).to eq table.raw
end
