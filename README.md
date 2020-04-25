# enumerable_methods_in_ruby

# CODE USAGE GOES HERE!

puts "\ntesting my_each method...\n"
result = ({ firstName: 'Sunday', lastName: 'Ezeilo' }.my_each { |name, val| puts "#{name}: #{val}" })
p result

puts "\ntesting my*each_with_index method...\n"
result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_each_with_index { |elm, ind| puts "index*#{ind}: #{elm}" }
p result

puts "\ntesting my_select method...\n"
result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_select { |elm| elm % 2 == 0 }
p result

puts "\ntesting my_any? method...\n"
result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_any? { |n| n < 1 }
p result
