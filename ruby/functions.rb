
# Returns an array containing the indices of all vowels
# in given string
def indices_of_vowels string
  indices = []
  index = 0
  string.each_char do |char|
    if char =~ /a|e|i|o|u|A|E|I|O|U/
      indices.append(index)
    end
    index += 1
  end

  # The last expression in a function gets returned
  indices
end

def indices_of_vowels_cool string
  (0...string.size).filter do |index|
    string[index] =~ /a|e|i|o|u|A|E|I|O|U/
  end
end

print indices_of_vowels("hello world"), "\n"
print indices_of_vowels("Hamilton COLLEGE"), "\n"

print indices_of_vowels_cool("hello world"), "\n"
print indices_of_vowels_cool("Hamilton COLLEGE"), "\n"

# Returns "Fizz" if n is disible by 3, and otherwise
# returns "Buzz"
def fizz n
  if n % 3 == 0
    return "Fizz"
  end
  "Buzz"
end

print (0..20).map {|n| fizz(n)}, "\n"
