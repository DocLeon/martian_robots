Feature: Instructing Martian Robots
  In order to control and keep track of robots
  As a member of the Earth robot command centre
  I want to send instructions to the robots and be told their final position

Scenario: Send instructions to one robot
  Given I have a robot on Mars
  When I send these instructions:
  |5 3|
  |1 1 E|
  |RFRFRFRF|
  Then I should receive "1 1 E"
