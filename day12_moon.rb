class Day12Moon
  attr_accessor :position, :velocity

  def initialize(pos)
    @position = pos
    @velocity = [0,0,0]
  end

  def update_velocity(other_moon)
    other_moon.position.each_with_index do |pos,index|
      difference = pos - self.position[index]
      case
        when difference > 0
          self.velocity[index] += 1
        when difference < 0
          self.velocity[index] -= 1
      end
    end
  end

  def update_position
    self.position.count.times do |index|
      self.position[index] += self.velocity[index]
    end
  end

  def energy
    self.velocity.sum(&:abs) * self.position.sum(&:abs)
  end

end
