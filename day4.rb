def meets_criteria?(num)
  digits = num.to_s.chars.map { |digit| digit.to_i }
  return true if non_decreasing?(digits) && two_adjacent?(digits)
  false
end

def two_adjacent?(digits)
  (0...digits.length).each do |i|
    if digits[i] == digits[i+1]
      if i > 0 && i < digits.length - 1 #In between digits
        return true if digits[i] != digits[i-1] && digits[i+1] != digits[i+2]
      elsif i > 0 #Last two digits
        return true if digits[i] != digits[i-1]
      elsif i < digits.length - 1 #First two digits
        return true if digits[i+1] != digits[i+2]
      end
    end
  end
  false
end

def non_decreasing?(digits)
  (1...digits.length).each do |i|
    return false if digits[i] < digits[i-1]
  end
  true
end

passwords = (183564..657474).select { |num| meets_criteria?(num) }

puts passwords.count
