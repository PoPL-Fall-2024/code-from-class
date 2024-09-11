# If statements
# Note: Ruby doesn't care about indentation
# If statements (and other constructs) terminate with "end"

print "Enter your favorite color: "
color = gets.chomp

if color == "yellow"
  puts "That's my favorite color!"
end

if color == "blue"
  puts "The sky is blue!"
else
  puts "#{color} is not the color of the sky."
end

if color == "red"
  puts "red is nice"
elsif color == "green"
  puts "Ruby has a strange elsif. Also, green is nice."
else
  puts "your color is #{color}"
end

if color.size > 3
  if color == "green"
    puts "yay green"
  else
    puts "yay not green"
  end
else
  puts "your color has length less than 4"
end

# You can put the "if" at the end of a line:
puts "cool, orange" if color == "orange"

# while:
x = 1
while x < 1000
  puts x
  x *= 2
end

if color == "purple" then puts "royal!" else puts "not royal!" end
