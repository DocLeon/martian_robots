Given(/^I have a robot on Mars$/) do
  @command_centre = CommandCentre.new()
end

When(/^I send these instructions:$/) do |instructions|
  @command_centre.send(instructions.raw)
end

Then(/^I should receive "([^"]*)"$/) do |expected_output|
    expect(@command_centre.output).to eq expected_output
end
