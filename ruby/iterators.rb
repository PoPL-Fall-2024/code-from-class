
## Common iterators

# int.times
# repeats a code block int times
# optionally, can pass the index as an argument
# use this for a for loop that does something x times

5.times {puts "Ruby rules!"}

y = 10
y.times {|i| puts "loop variable/arg: #{i}"}

sum = 0
100.times do |x|
  sum += x
  puts x
end

puts "The sum of the integers between 0 and 99 is #{sum}"
# puts "The final value of x is #{x}" ## x not available outside block

## All of the following iterators work on multiple data structures:
## including arrays, hashes, ranges, etc.

# each - passes elements from data structure to block, one at a time

a = [5, 8, 17, 300, -4, 16]
a.each {|n| puts n * n}

product = 1
cat = a.each {|num| product *= num}
puts "Product of array: #{product}"

# print cat

# find - returns the first element that makes the block return true

print "The first element greater than 10: "
puts a.find {|n| n > 10}

small = a.find{|n| n < -100}
puts small == nil

# find_all (synonym filter) - returns array containing all elements
# that make the block true

print a.find_all {|n| n > 10}, "\n"
print a.filter {|x| x % 2 == 0}, "\n"

# let's find all prime numbers less than 100

primes = (1..100).find_all do |num|
  divisors = (1..num).find_all {|div| num % div == 0}
  divisors.size == 2
end

puts "The primes less than 100: #{primes}"

# map (synonym collect) - creates a new array containing the
# result of applying the block to each element in the data structure

squares = a.map {|x| x * x}
puts "The squares of a: #{squares}"

print a.map {|dog| 100 + dog}, "\n"

print "a: #{a}", "\n"

# exclamation point version changes the array!

print a.map! {|dog| 100 + dog}, "\n"
