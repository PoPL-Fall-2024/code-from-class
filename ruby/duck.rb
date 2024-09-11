
x = ["5", 10.0, 15]

i = 0
while i < 3
  puts (x[i].to_i) + 100
  i += 1
end


## This one fails on fourth element
x = ["5", 10.0, 15, [1, 2, 3]]

i = 0
while i < 4
  puts (x[i].to_i) + 200
  i += 1
end
