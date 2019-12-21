require './day12_moon.rb'

def update_moons(moon_array)
  moon_array.count.times do |moon_index|
    moon_array.each { |moon| moon_array[moon_index].update_velocity(moon); }
  end
  moon_array.each { |moon| moon.update_position }
end

def original_state? moon_array, original, dimension
  moon_array.each_with_index do |moon, moon_index|
    if moon.velocity[dimension] != 0 or moon.position[dimension] != original[moon_index][dimension]
      return false
    end
  end
  true
end

def set_up_moons
  moons=[]
  input.each do |val|
    moons << Day12Moon.new(val)
  end
  moons
end

def input
  [[12,0,-15],[-8,-5,-10],[7,-17,1],[2,-11,-6]]
end

def solve_part1
  moons=set_up_moons
  1000.times do 
    update_moons(moons)
  end

  puts "Part 1: #{moons.sum(&:energy)}" 
end

def solve_part2
  moons=set_up_moons
  periods = [0,0,0]
  counter = 1

  while(periods.include? 0)
    update_moons(moons)
    periods.count.times do |dimension|
      if periods[dimension] == 0 and original_state? moons, input, dimension
        periods[dimension] = counter
        puts "Found period for index #{dimension}!"
      end
    end
    counter += 1
  end

  puts "Part 2: #{periods.reduce(1,&:lcm)}"
end

solve_part1
solve_part2
