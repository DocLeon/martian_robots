Given(/^I have (?:a )?robot(?:s)? on Mars$/) do
  @command_centre = CommandCentre.new()
end

When(/^I send these instructions:$/) do |instructions|
  commands = []
  instructions.raw.each do |instruction|
    commands << instruction[0]
  end
  @command_centre.send(commands)
end

Then(/^I should receive:$/) do |expected_output|
  expected_output.diff!(@command_centre.output)
end
