counter = 0

IO.foreach("input.txt") do |mass|
  fuel = (mass.to_i / 3) - 2
  while fuel > 0 do
    counter += fuel
    fuel = fuel / 3 - 2
  end
end

puts counter
