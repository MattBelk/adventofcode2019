class Day3Wires
  require 'set'
  attr_reader :wire1, :wire2
  def initialize (wire1, wire2)
    @wire1 = wire1
    @wire2 = wire2
  end

  def pathcoordinates(wire)
    x, y = 0, 0
    steps = 0
    coords = Set.new
    wire.each do |value|
      direction = value[0]
      length = value[1..-1].to_i
      case direction
        when 'U'
          length.times do
            y += 1
            coords.add [x,y]
          end
        when 'R'
          length.times do
            x += 1
            coords.add [x,y]
          end
        when 'D'
          length.times do
            y -= 1
            coords.add [x,y]
          end
        when 'L'
          length.times do
            x -= 1
            coords.add [x,y]
          end
      end
    end
    coords
  end

  def intersections
    self.pathcoordinates(@wire1) & self.pathcoordinates(@wire2)
  end

end
