# Open classes
# You can open existing classes to add functionality

class String

  # Returns true if a string is entirely made of capital letters
  def caps?
    self =~ /\A[A-Z]*\Z/
  end

  def size
    17
  end

end

puts "hello".size

class Integer
  def +(other)
    self - other
  end


  def to_s
    "hello"
  end
end

puts 5 + 7

puts 5
