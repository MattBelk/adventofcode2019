require './day12_moon.rb'

input = [[12,0,-15],[-8,-5,-10],[7,-17,1],[2,-11,-6]]
moons=[]

input.each do |val|
  moons << Day12Moon.new(val)
end

(1..1000).each do |index|
  moons.count.times do |moon_index|
    moons.each { |moon| moons[moon_index].update_velocity(moon); }
  end
  moons.each { |moon| moon.update_position }
end

puts moons.sum(&:energy)
