orbits = {}
IO.foreach("input6.txt") do |line|
  pair = line.split(')')
  orbits[pair[1].chomp.to_sym] = pair[0].to_sym
end

def orbit_path(orbits, planet) 
  if orbits.key?(planet) #Planet is orbiting something, add it to the path of the planet being orbited
    orbit_path(orbits, orbits[planet]) << planet
  else #Add COM at the end
    [:COM]
  end
end

def different_planets(path1, path2)
  path1.select { |planet| !path2.include? planet }
end

total_orbits = (orbits.keys.map { |planet| orbit_path(orbits, planet).count - 1 }).sum
puts "Part 1: #{total_orbits}"

you_path = orbit_path(orbits, :YOU)
san_path = orbit_path(orbits, :SAN)

different_planets = different_planets(you_path, san_path) + different_planets(san_path, you_path)
puts different_planets.include? :SAN

puts "Part 2: #{different_planets.count - 2}" 
