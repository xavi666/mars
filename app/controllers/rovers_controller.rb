class RoversController < ApplicationController
  include InputValidator

  def index
  end

  def move
    # List of Rovers
    @rovers = []
    # Input param
    input = params[:input].split("\r\n")

    # Map Config
    plateau_map = input[0]

    # Rovers Map Config
    rovers_instructions = []
    input[1..-1].each do |ri|
      rovers_instructions << ri
    end
    list_positions = rovers_instructions.values_at(* rovers_instructions.each_index.select {|i| i.even?})
    list_instructions = rovers_instructions.values_at(* rovers_instructions.each_index.select {|i| i.odd?})
    # Pair of Rover / Instructions
    rovers_instructions_pair = list_positions.zip(list_instructions)

    # Validating Map
    if valid_plateau?(plateau_map)
      # Validating Rover/Instructions
      if valid_configuration?(rovers_instructions_pair)
        plateau = Plateau.new(plateau_map)

        # Iterating Rovers
        rovers_instructions_pair.each do |rover_instruction|
          current_position = rover_instruction.first
          instructions = rover_instruction.last

          rover = Rover.new(current_position)
          # Moving Rover
          rover.move(rover, plateau, instructions)
          @rovers << rover
        end        
      else
        flash.now[:error] = "Invalid Rover/Instructions Configuration"
      end
    else
      flash.now[:error] = "Invalid Map Configuration"
    end
    render :action => :index
  end

end