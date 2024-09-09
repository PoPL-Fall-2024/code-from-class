## NOTE: This file has most of the irb commands
## that we saw in class. Unfortunately, the first
## things we did got cut off because it was too long.

:kind_of?,
:is_a?,
:display,
:public_send,
:pretty_inspect,
:extend,
:!~,
:class,
:frozen?,
:tap,
:then,
:yield_self,
:nil?,
:respond_to?,
:method,
:public_method,
:singleton_method,
:define_singleton_method,
:hash,
:freeze,
:object_id,
:send,
:to_enum,
:enum_for,
:equal?,
:!,
:__send__,
:!=,
:instance_eval,
:instance_exec,
:__id__]
irb(main):012> 4.methods.class
=> Array
irb(main):013> 4.methods.sort
=>
[:!,
:!=,
:!~,
:%,
:&,
:*,
:**,
:+,
:+@,
:-,
:-@,
:/,
:<,
:<<,
:<=,
:<=>,
:==,
:===,
:>,
:>=,
:>>,
:[],
:^,
:__id__,
:__send__,
:abs,
:abs2,
:allbits?,
:angle,
:anybits?,
:arg,
:between?,
:bit_length,
:ceil,
:ceildiv,
:chr,
:clamp,
:class,
:clone,
:coerce,
:conj,
:conjugate,
:define_singleton_method,
:denominator,
:digits,
:display,
:div,
:divmod,
:downto,
:dup,
:enum_for,
:eql?,
:equal?,
:even?,
:extend,
:fdiv,
:finite?,
:floor,
:freeze,
:frozen?,
:gcd,
:gcdlcm,
:hash,
:i,
:imag,
:imaginary,
:infinite?,
:inspect,
:instance_eval,
:instance_exec,
:instance_of?,
:instance_variable_defined?,
:instance_variable_get,
:instance_variable_set,
:instance_variables,
:integer?,
:is_a?,
:itself,
:kind_of?,
:lcm,
:magnitude,
:method,
:methods,
:modulo,
:negative?,
:next,
:nil?,
:nobits?,
:nonzero?,
:numerator,
:object_id,
:odd?,
:ord,
:phase,
:polar,
:positive?,
:pow,
:pred,
:pretty_inspect,
:pretty_print,
:pretty_print_cycle,
:pretty_print_inspect,
:pretty_print_instance_variables,
:private_methods,
:protected_methods,
:public_method,
:public_methods,
:public_send,
:quo,
:rationalize,
:real,
:real?,
:rect,
:rectangular,
:remainder,
:remove_instance_variable,
:respond_to?,
:round,
:send,
:singleton_class,
:singleton_method,
:singleton_method_added,
:singleton_methods,
:size,
:step,
:succ,
:tap,
:then,
:times,
:to_c,
:to_enum,
:to_f,
:to_i,
:to_int,
:to_r,
:to_s,
:truncate,
:upto,
:yield_self,
:zero?,
:|,
:~]
irb(main):014> print 4.methods.sort
[:!, :!=, :!~, :%, :&, :*, :**, :+, :+@, :-, :-@, :/, :<, :<<, :<=, :<=>, :==, :===, :>, :>=, :>>, :[], :^, :__id__, :__send__, :abs, :abs2, :allbits?, :angle, :anybits?, :arg, :between?, :bit_length, :ceil, :ceildiv, :chr, :clamp, :class, :clone, :coerce, :conj, :conjugate, :define_singleton_method, :denominator, :digits, :display, :div, :divmod, :downto, :dup, :enum_for, :eql?, :equal?, :even?, :extend, :fdiv, :finite?, :floor, :freeze, :frozen?, :gcd, :gcdlcm, :hash, :i, :imag, :imaginary, :infinite?, :inspect, :instance_eval, :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :integer?, :is_a?, :itself, :kind_of?, :lcm, :magnitude, :method, :methods, :modulo, :negative?, :next, :nil?, :nobits?, :nonzero?, :numerator, :object_id, :odd?, :ord, :phase, :polar, :positive?, :pow, :pred, :pretty_inspect, :pretty_print, :pretty_print_cycle, :pretty_print_inspect, :pretty_print_instance_variables, :private_methods, :protected_methods, :public_method, :public_methods, :public_send, :quo, :rationalize, :real, :real?, :rect, :rectangular, :remainder, :remove_instance_variable, :respond_to?, :round, :send, :singleton_class, :singleton_method, :singleton_method_added, :singleton_methods, :size, :step, :succ, :tap, :then, :times, :to_c, :to_enum, :to_f, :to_i, :to_int, :to_r, :to_s, :truncate, :upto, :yield_self, :zero?, :|, :~]=> nil
irb(main):015> puts 4.methods.sort
!
!=
!~
%
&
*
**
+
+@
-
-@
/
<
<<
<=
<=>
==
===
>
>=
>>
[]
^
__id__
__send__
abs
abs2
allbits?
angle
anybits?
arg
between?
bit_length
ceil
ceildiv
chr
clamp
class
clone
coerce
conj
conjugate
define_singleton_method
denominator
digits
display
div
divmod
downto
dup
enum_for
eql?
equal?
even?
extend
fdiv
finite?
floor
freeze
frozen?
gcd
gcdlcm
hash
i
imag
imaginary
infinite?
inspect
instance_eval
instance_exec
instance_of?
instance_variable_defined?
instance_variable_get
instance_variable_set
instance_variables
integer?
is_a?
itself
kind_of?
lcm
magnitude
method
methods
modulo
negative?
next
nil?
nobits?
nonzero?
numerator
object_id
odd?
ord
phase
polar
positive?
pow
pred
pretty_inspect
pretty_print
pretty_print_cycle
pretty_print_inspect
pretty_print_instance_variables
private_methods
protected_methods
public_method
public_methods
public_send
quo
rationalize
real
real?
rect
rectangular
remainder
remove_instance_variable
respond_to?
round
send
singleton_class
singleton_method
singleton_method_added
singleton_methods
size
step
succ
tap
then
times
to_c
to_enum
to_f
to_i
to_int
to_r
to_s
truncate
upto
yield_self
zero?
|
~
=> nil
irb(main):016> puts 1.methods.sort
!
!=
!~
%
&
*
**
+
+@
-
-@
/
<
<<
<=
<=>
==
===
>
>=
>>
[]
^
__id__
__send__
abs
abs2
allbits?
angle
anybits?
arg
between?
bit_length
ceil
ceildiv
chr
clamp
class
clone
coerce
conj
conjugate
define_singleton_method
denominator
digits
display
div
divmod
downto
dup
enum_for
eql?
equal?
even?
extend
fdiv
finite?
floor
freeze
frozen?
gcd
gcdlcm
hash
i
imag
imaginary
infinite?
inspect
instance_eval
instance_exec
instance_of?
instance_variable_defined?
instance_variable_get
instance_variable_set
instance_variables
integer?
is_a?
itself
kind_of?
lcm
magnitude
method
methods
modulo
negative?
next
nil?
nobits?
nonzero?
numerator
object_id
odd?
ord
phase
polar
positive?
pow
pred
pretty_inspect
pretty_print
pretty_print_cycle
pretty_print_inspect
pretty_print_instance_variables
private_methods
protected_methods
public_method
public_methods
public_send
quo
rationalize
real
real?
rect
rectangular
remainder
remove_instance_variable
respond_to?
round
send
singleton_class
singleton_method
singleton_method_added
singleton_methods
size
step
succ
tap
then
times
to_c
to_enum
to_f
to_i
to_int
to_r
to_s
truncate
upto
yield_self
zero?
|
~
=> nil
irb(main):017> puts 1.43543.methods.sort
!
!=
!~
%
*
**
+
+@
-
-@
/
<
<=
<=>
==
===
>
>=
__id__
__send__
abs
abs2
angle
arg
between?
ceil
clamp
class
clone
coerce
conj
conjugate
define_singleton_method
denominator
display
div
divmod
dup
enum_for
eql?
equal?
extend
fdiv
finite?
floor
freeze
frozen?
hash
i
imag
imaginary
infinite?
inspect
instance_eval
instance_exec
instance_of?
instance_variable_defined?
instance_variable_get
instance_variable_set
instance_variables
integer?
is_a?
itself
kind_of?
magnitude
method
methods
modulo
nan?
negative?
next_float
nil?
nonzero?
numerator
object_id
phase
polar
positive?
pretty_inspect
pretty_print
pretty_print_cycle
pretty_print_inspect
pretty_print_instance_variables
prev_float
private_methods
protected_methods
public_method
public_methods
public_send
quo
rationalize
real
real?
rect
rectangular
remainder
remove_instance_variable
respond_to?
round
send
singleton_class
singleton_method
singleton_method_added
singleton_methods
step
tap
then
to_c
to_enum
to_f
to_i
to_int
to_r
to_s
truncate
yield_self
zero?
=> nil
irb(main):018> 3.43.to_s
=> "3.43"
irb(main):019> 3.43.to_int
=> 3
irb(main):020> 3.43.to_i
=> 3
irb(main):021> 3.43.to_i()
=> 3
irb(main):022> puts("hello")_
<internal:kernel>:187:in `loop': (irb):22: syntax error, unexpected local variable or method, expecting end-of-input (SyntaxError)
puts("hello")_
            ^

       from /usr/local/rvm/gems/ruby-3.3.4/gems/irb-1.14.0/exe/irb:9:in `<top (required)>'
       from /usr/local/rvm/gems/default/bin/irb:25:in `load'
       from /usr/local/rvm/gems/default/bin/irb:25:in `<main>'
irb(main):023> puts("hello")
hello
=> nil
irb(main):024>

ruby $ ruby intro.rb
Enter a year: 1812
[2, 1, 8, 1]the end
ruby $ ruby intro.rb
Enter a year: 1812
2
1
8
1
the end
ruby $ ruby intro.rb
Enter a year: 1812
[2, 1, 8, 1]
the end
ruby $ ruby intro.rb
Enter a year: 1812
[2, 1, 8, 1]
the end
ruby $ ruby intro.rb
Enter a year: 1812
[2, 1, 8, 1]

the end
ruby $ ruby intro.rb
Enter a year: 1812
[1, 8, 1, 2]
the end
ruby $ ruby intro.rb
Enter a year: 1812
1812
the end
ruby $ irb
irb(main):001> 34
=> 34
irb(main):002> -4
=> -4
irb(main):003> 3_009_022
=> 3009022
irb(main):004> 43.23
=> 43.23
irb(main):005> 163.34e5
=> 16334000.0
irb(main):006> 2378904238974789237892345789423789423789789423789432789
=> 2378904238974789237892345789423789423789789423789432789
irb(main):007> 20 / 3
=> 6
irb(main):008> 20 / 3.0
=> 6.666666666666667
irb(main):009> 20 / 3.to_f
=> 6.666666666666667
irb(main):010> 400 * 200
=> 80000
irb(main):011> 400 ** 200
=> 25822498780869085896559191720030118743297057928292235128306593565406476220168411946296453532801378314359031719727474933760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
irb(main):012> 3 == 7
=> false
irb(main):013> 6 < 234
=> true
irb(main):014>

ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
ruby $ irb
irb(main):001> 'hi \n there'
=> "hi \\n there"
irb(main):002> "hi \n there"
=> "hi \n there"
irb(main):003>

ruby $ irb
irb(main):001>

ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
hi
there
ruby $ irb
irb(main):001> "hi \n there"
=> "hi \n there"
irb(main):002>

ruby $ ruby intro.rb
Enter a year: 12
[1, 2]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
ruby $ ruby intro.rb
Enter a year: 213
[2, 1, 3]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
crazy 12
ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
crazy 12
2
ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
2
crazy 12
2
ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
2
crazy 12
2
ruby $
ruby $
ruby $ ruby intro.rb
Enter a year: 2
[2]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
2
crazy 12
2
hi  !
ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
2
crazy 12
2
hi  !
intro.rb:32:in `<main>': undefined local variable or method `asdawda' for main (NameError)

puts asdawda
    ^^^^^^^
ruby $ ruby intro.rb
Enter a year: 324
[3, 2, 4]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
2
crazy 12
2
hi  !
intro.rb:32:in `<main>': undefined local variable or method `asdawda' for main (NameError)

f = asdawda
   ^^^^^^^
ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
2
crazy 12
2
hi  !
intro.rb:32:in `<main>': undefined local variable or method `asdawda' for main (NameError)

f = asdawda
   ^^^^^^^
ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
2
crazy 12
2
hi NilClass !
ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
2
crazy 12
2
hi  - NilClass !
ruby $ ruby intro.rb
Enter a year: 123
[1, 2, 3]
the end
hi \n there
hi
there
I have 5 dogs
You can evaluate expressions inside the curly brackets:
For example: 50 dogs!
2
crazy 12
2
hi  - NilClass !
hi
tjere
asdwdw
ruby $ irb
irb(main):001> # symble:
=> nil
irb(main):002> :hello
=> :hello
irb(main):003> :hello.obje
(irb):3:in `<main>': undefined method `obje' for an instance of Symbol (NoMethodError)

:hello.obje
     ^^^^^
       from <internal:kernel>:187:in `loop'
       from /usr/local/rvm/gems/ruby-3.3.4/gems/irb-1.14.0/exe/irb:9:in `<top (required)>'
       from /usr/local/rvm/gems/default/bin/irb:25:in `load'
       from /usr/local/rvm/gems/default/bin/irb:25:in `<main>'
irb(main):004> :hello.object_id
=> 2705628
irb(main):005> :hello.object_id
=> 2705628
irb(main):006> :hello.object_id
=> 2705628
irb(main):007> a = :hello
=> :hello
irb(main):008> a.object_id
=> 2705628
irb(main):009>

ruby $ irb
irb(main):001> :hello.object_id
=> 2704668
irb(main):002> :adam
=> :adam
irb(main):003> :class220
=> :class220
irb(main):004> :class_220
=> :class_220
irb(main):005> :adam.object_id
=> 2705628
irb(main):006> :hello.object_id
=> 2704668
irb(main):007> print 4.methods
[:magnitude, :abs, :floor, :ceil, :round, :truncate, :**, :<=>, :<<, :>>, :<=, :allbits?, :anybits?, :nobits?, :downto, :pred, :next, :pow, :[], :===, :digits, :>=, :==, :-@, :zero?, :upto, :integer?, :%, :&, :numerator, :denominator, :chr, :+, :gcd, :-, :inspect, :/, :*, :gcdlcm, :lcm, :rationalize, :size, :<, :succ, :>, :to_int, :ord, :to_s, :to_i, :to_f, :to_r, :bit_length, :even?, :odd?, :ceildiv, :div, :divmod, :fdiv, :^, :times, :coerce, :|, :modulo, :remainder, :~, :to_json, :nonzero?, :+@, :dup, :negative?, :step, :positive?, :eql?, :infinite?, :finite?, :arg, :real?, :rectangular, :singleton_method_added, :rect, :real, :imaginary, :polar, :abs2, :angle, :phase, :conjugate, :conj, :to_c, :imag, :pretty_print, :quo, :pretty_print_cycle, :clone, :i, :between?, :clamp, :to_yaml, :pretty_print_inspect, :pretty_print_instance_variables, :singleton_class, :itself, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :display, :public_send, :pretty_inspect, :extend, :Namespace, :!~, :class, :frozen?, :tap, :then, :yield_self, :nil?, :respond_to?, :method, :public_method, :singleton_method, :define_singleton_method, :hash, :freeze, :object_id, :TypeName, :send, :to_enum, :enum_for, :equal?, :!, :__send__, :!=, :instance_eval, :instance_exec, :__id__]=> nil
irb(main):008> nil
=> nil
irb(main):009> nil.class
=> NilClass
irb(main):010> nil == false
=> false
irb(main):011> a = :class
=> :class
irb(main):012> a == :class
=> true
irb(main):013> a == :adam
=> false
irb(main):014>
