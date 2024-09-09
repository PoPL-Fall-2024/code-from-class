print "Enter a year: "
year = gets.to_i

## Prints the digits of the integer
print year.digits.reverse
puts
puts("the end")

## two types of strings:

## single quoted strings are treated literally
puts 'hi \n there' # treat as \ and n, not a newline

## double quoted strings interpret escape characters
puts "hi \n there" # escape character for newline

## double quoted strings also allow for
## _string interpolation_ - insert inside a
## string literal some code to be evaluated
## and then included in the string

dogs = 5
puts "I have #{dogs} dogs"
puts "You can evaluate expressions inside the curly brackets:"
puts "For example: #{dogs * 10} dogs!"
puts "crazy #{cats = 2; p cats; cats + 10} "
puts cats

x = "hi #{x} - #{x.class} !"

puts x

puts "hi
tjere
asdwdw"

# symbols - "A symbol is a constant integer
# with a human readable name"
# another way to think of them: as a string
# that you will never manipulate like text
# (i.e. index within it, find substring, etc.
