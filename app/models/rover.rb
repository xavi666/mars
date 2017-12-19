class Rover

  ROTATE_MAPPING = {
    "NL" => "W", "NR" => "E", "EL" => "N", "ER" => "S",
    "SL" => "E", "SR" => "W", "WL" => "S", "WR" => "N"
  }

  attr_accessor :x, :y, :direction

  def initialize(start_position)
    position_splitted = start_position.split(" ")
    self.x = position_splitted[0].to_i
    self.y = position_splitted[1].to_i
    self.direction = position_splitted[2]
  end

  def show_coordinates
    "#{x} #{y} #{direction}"
  end

  # Movement Methods

  def move(rover, plateau, rovers_instructions)
    results = []

    rovers_instructions.split('').each do |instruction|
      case instruction.upcase
        when "L", "R" then rover.direction = rotate(rover.direction, instruction)
        when "M" then rover.x, rover.y = forward(rover.x, rover.y, rover.direction, plateau)
      end
    end
  end

  def forward(x, y, direction, plateau)
    x_new = x
    y_new = y

    case direction
      when "N" then y_new = y + 1
      when "S" then y_new = y - 1
      when "E" then x_new = x + 1
      when "W" then x_new = x - 1
    end

    if !plateau.possible_movement?(x_new, y_new)
      Rails.logger.info "Rover can't move outside to #{x_new}, #{y_new}"
      return x, y
    else
      puts "#{x_new} #{y_new}"
      return x_new, y_new
    end
  end

  def rotate(rover_dir, move_dir)
    ROTATE_MAPPING["#{rover_dir}#{move_dir}"]
  end

end