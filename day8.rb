def split_into_layers(string, num)
  return nil if string.length % num != 0
  if(string.length == num)
    [string]
  else
    split_into_layers(string[0...string.length - num], num) << string[string.length - num...string.length]
  end
end

def colour(string)
  (string.gsub '2', '')[0]
end

input = File.read("input8.txt")
height = 6
width = 25
length_of_layers = height * width

layers = split_into_layers(input, length_of_layers)

fewest_zeros_layer = layers.min { |layer1,layer2| layer1.count('0') <=> layer2.count('0') }
puts "Part 1: #{fewest_zeros_layer.count('1') * fewest_zeros_layer.count('2')}", ""

msg=''
length_of_layers.times do |index|
  colourstring = ''
  layers.each { |layer| colourstring << layer[index] }
  msg << colour(colourstring)
end

height.times do |row|
  puts (msg.gsub '0', ' ')[0 + row*width...(row+1)*width]
end
