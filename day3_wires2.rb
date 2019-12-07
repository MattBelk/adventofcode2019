class Day3Wires2
  attr_reader :wire1, :wire2
  def initialize (wire1, wire2)
    @wire1 = wire1
    @wire2 = wire2
  end

  def pathcoordinates(wire)
    x, y = 0, 0
    steps = 0
    coords = {}
    wire.each do |value|
      direction = value[0]
      length = value[1..-1].to_i
      case direction
        when 'U'
          length.times do
            y += 1
            steps += 1
            coords[[x,y]] = steps unless coords[[x,y]]
          end
        when 'R'
          length.times do
            x += 1
            steps += 1
            coords[[x,y]] = steps unless coords[[x,y]]
          end
        when 'D'
          length.times do
            y -= 1
            steps += 1
            coords[[x,y]] = steps unless coords[[x,y]]
          end
        when 'L'
          length.times do
            x -= 1
            steps += 1
            coords[[x,y]] = steps unless coords[[x,y]]
          end
      end
    end
    coords
  end

  def solve
    coords1 = self.pathcoordinates(@wire1)
    coords2 = self.pathcoordinates(@wire2)
    puts ((coords1.keys & coords2.keys).map {|x,y| coords1[[x,y]] + coords2[[x,y]]}).min
  end

end
