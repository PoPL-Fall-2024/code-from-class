# Open classes
# You can open existing classes to add functionality

class String

  # Returns true if a string is entirely made of capital letters
  def caps?
    self =~ /\A[A-Z]*\Z/
  end
end
