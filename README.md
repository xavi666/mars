# README

== Xing - Mars Rover
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co- ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same Heading.

Assume that the square directly North from (x, y) is (x, y+1).

== Getting Started
- Running and goig to localhost:3000 you'll se an input textarea.
- Introducing data in here, like:
	5 5
	1 2 N
	LMLMLMLMM
	3 3 E
	MMRMMRMRRM
- You'll get an output:
	1 3 N
	5 1 E

== Description of Contents
- The default directory structure of a generated Ruby on Rails application:

- 2 Models:
	- Plateau: with an initializer and the method that checks the allowed movements. 
	- Rover:
		- initializer: it sets initial x, y, direction
		- show_coordinates: it displays de coordinates (x, y)
		- move: we have got 2 typs of instructions:
			- L/R to move left or right
			- M to go forward
		- forward: updates x/y depending on the instruction
		- rotate: updates the current rover direction

- Rovers Controller
	- Moves method: it gets the data from the input and processes it to create the Plateu and as many Rovers as required. It also calls validations.

- Rovers > Index View
	It displays the input and the ouput all in the same page.

- Lib > Input_validator
	Module that validates the input (Plateu size, Rovers initial position and Rovers movements)

- Gems Haml and Bootstrap are the only Gems added on Gemfile from default configuration.


