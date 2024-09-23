
# this calls its code block twice
def do_twice
  yield
  yield
end

# define an iterator that uses arguments
# yields each odd number below top
def odd_numbers_below(top)
  num = 1
  while num < top
    yield num
    num += 2
  end
  "Hi class"
end

def sum_some_stuff_passing_1_to_10
  sum = 0
  (1..10).each do |n|
    sum += yield n
  end
  sum
end

## A mixin module is a way of including code from a module in a class
## i.e. they automatically add methods to a class
## Enumerable mixin - adds many common iterators (find, map, inject, filter, etc.)
##    to a class
## To use enumerable, your class must define the each method
## if you additionally have <=> defined on the yielded things, you also
## get the methods sort, min, max

class Colors
  include Enumerable

  def each
    yield "red"
    yield "orange"
    yield "yellow"
    yield "green"
    yield "blue"
    yield "purple"
  end
end

wheel = Colors.new
wheel.map {|s| s.succ}
wheel.sort

class ColorString < String
  def <=>(other)
    if self.size == other.size
      return 0
    elsif self.size < other.size
      return -1
    else
      return 1
    end
  end
end

class Colors2
  include Enumerable

  def each
    yield ColorString.new "red"
    yield ColorString.new "orange"
    yield ColorString.new "yellow"
    yield ColorString.new "green"
    yield ColorString.new "blue"
    yield ColorString.new "purple"
  end
end

w = Colors2.new
w.sort
