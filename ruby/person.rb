# Person class to store info about a person
class Person

  ## This will make a getter and a setter for @age
  attr_accessor :age

  ## attr_reader makes a getter
  ## attr_writer makes a setter

  # constructor for Person
  def initialize(full_name, age)
    @name = full_name
    @age = age
    ## @name and @age are the attributes
  end

  # Takes another person as a parameter and prints an introduction
  # accessor methods access attributes
  def introduce other_person
    puts "Hello #{other_person}, my name is #{@name}. I am #{@age} years old."
  end

  # mutator methods change attributes
  def birthday
    @age += 1
  end

  def to_s
    @name
  end

end

dennis = Person.new("Dennis", 37)
arthur = Person.new "Arthur", 56
maria = Person.new("Maria", 20)

dennis.introduce(arthur)
dennis.introduce(maria)

dennis.birthday
puts dennis.age
