module InputValidator

  def valid_plateau?(plateau_corner)
    coord = plateau_corner.split(' ')
    !(plateau_corner.blank? or coord.size != 2 or !coord[0].is_i? or !coord[1].is_i? or coord[0].to_i < 0 or coord[1].to_i < 0)
  end  

  def valid_rover_instructions?(rovers_instructions)
    rovers_instructions.each do |rover_instruction|
      return false if !valid_rover?(rover_instruction.first) and valid_instructions?(rover_instruction.last)
    end
  end

  def valid_rover?(start_position)
    allowed_coordinates = ["N", "S", "E", "W"]
    start_position_split = start_position.split(" ")
    return false if start_position.blank?
    return false if start_position_split.size != 3
    x, y, direction = start_position_split[0], start_position_split[1], start_position_split[2]
    x.is_i? and y.is_i? and allowed_coordinates.include? direction
  end

  def valid_instructions?(instructions)
    !instructions.blank?
  end

  def valid_configuration?(rovers_instructions)
    valid_rover_instructions?(rovers_instructions)
  end

end