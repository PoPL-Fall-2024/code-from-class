def mean(numbers)
  numbers.sum / numbers.size
end

a = [1, 2, "cat", 4]
b = []
c = [1, 5, 100]

# puts mean(c)
# puts mean(a)
# puts mean(b)

begin
  puts mean(c)
  puts mean(b)
  puts mean(a)
rescue ZeroDivisionError => zero_error
  puts "You can't find the mean of 0 numbers!"
  puts zero_error
  # retry
  # raise
rescue TypeError
  puts "Your array has something in it besides numbers!"
  # retry
  # raise
end

class MeanOfEmptyArrayError < ZeroDivisionError
  def to_s
    "Man, why did you try to find the mean of an empty array????"
  end
end

def meanWithException(numbers)
  if numbers.empty?
    raise MeanOfEmptyArrayError
  end
  numbers.sum / numbers.size
end

begin
  puts meanWithException(c)
  puts meanWithException(b)
rescue MeanOfEmptyArrayError => zero_error
  puts "You tried to find the mean of an empty array!"
  # puts zero_error
  # raise
end

puts "We made it to the end!"


# Catch/Throw allows you to immediately exit function calls until you get to catch
# Without raising an exception!

# Print the char if it isn't a space in uppercase
# If it is a space, throw back to catch
def print_uppercase_no_space char
  throw :hit_a_space if char == " "
  puts char.upcase
  throw :hit_a_questionmark if char == "?"
end

catch :hit_a_space do
  catch :hit_a_questionmark do
    print "Enter a string: "
    string = gets.chomp
    string.each_char {|c| print_uppercase_no_space c}
    puts "we never get here!"
  end
  puts "we're here!"
end

puts "We're at the end now!"
