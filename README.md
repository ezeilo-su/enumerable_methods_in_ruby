## Enumerable Methods Implementation In Ruby Language

> This project implements enumerable methods in Ruby. Return values of those methods are those returned by the default ruby enumerable methods. Code usage has also been provided in this document in the "Code usage goes here" section.

> The project description can be found [here](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/archive/basic_ruby/project_advanced_building_blocks.md#project-2-enumerable-methods).

## Automated Test Case
- Test automation provided for this project is based on RSpec tool. The test cases are found in the 'enumerable_methods_spec.rb' file which resides in 'spec' folder, a sub folder in the project directory.
- To run the test cases, open your terminal and navigate to the aboved mentioned directory.
- ToRun the 'enumerable_methods_spec.rb' file by typing the following:
- rspec enumerable_methods_spec.rb from the specific directory
- Hit 'Enter' key on the keyboard
- When the available test cases are evaluated, corresponding messages are retured.

## Built With

- Ruby Language

## Live Demo

[![Run on Repl.it](https://repl.it/badge/github/ezeilo-su/enumerable_methods_in_ruby)](https://repl.it/github/ezeilo-su/enumerable_methods_in_ruby)

### Code usage goes here:

```Ruby
# CODE USAGE GOES HERE!

# puts "\ntesting my_each method...\n"
# result = ({ firstName: 'Sunday', lastName: 'Ezeilo' }.my_each { |name, val| puts "#{name}: #{val}" })
# p result

# puts "\ntesting my_each_with_index method...\n"
# result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_each_with_index { |elm, ind| puts "index_#{ind}: #{elm}" }
# p result

# puts "\ntesting my_select method...\n"
# result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_select { |elm| elm % 2 == 0 }
# p result

# puts "\ntesting my_all? method...\n"
# result = [1, 2, 3, 4, 5, 10].my_all? { |x| x < 10 }
# p result

# Test my_all? with a RegEx object
# p %w([2 3 4 5 6]).my_all?(/[0-9]/)

# Test my_all? with the Integer Class
# p [2, 3, 4, 5, 6].my_all?(Integer)

# Test my_all? with the String Class
# p %w([hello foo baa]).my_all?(String)

# puts "\ntesting my_any? method...\n"
# result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_any? { |n| n < 1 }
# p result

# puts "\ntesting my_any? method...\n"
# result = [1, 2, 3, 4, 5, 10].any? { |x| x > 10 }
# p result

# Test my_any? method with all falsy values
# p [false, nil].my_any?

# Test my_any? method with at least one truthy value
# p [false, nil, 2].my_any?(Integer)
# p [3,4,7,11].my_any?(3)

# puts "\ntesting my_none? method...\n"
# result = [1, 2, 3, 4, 5, 10].my_none? { |x| x > 10 }
# p result

# p [nil, false].my_none?
# p [1, 2.5, 'a', 9].my_none?(Integer)
# p %w[dog door rod blade].my_none?(/z/)
# p [3,4,7,11].my_none?(3)

# puts "\ntesting my_count method...\n"
# p [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].my_count { |n| n % 2 == 0 }

#   Test my_map method for both conditions
# puts "\ntesting my_map method...\n"
# p [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].my_map { |n| n*2 }
# my_proc = Proc.new {|num| num > 10 }
# p [18, 22, 5, 6].my_map(my_proc) {|num| num < 10 }

# Test my_inject with different conditions
# puts "\ntesting my_inject method...\n"
# p [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].my_inject(4) { |result_memo, n| result_memo + n }
# p (1..5).my_inject { |prod, n| prod * n }
# p [2, 5, 6].my_inject(:+)
# p multiply_els([2, 4, 5])

```

## Author

👤 **Sunday Uche Ezeilo**

- Github: [@sundayezeilo](https://github.com/ezeilo-su)
- Twitter: [@SundayEzeilo](https://twitter.com/SundayEzeilo)
- Linkedin: [Sunday Ezeilo](https://www.linkedin.com/in/sunday-ezeilo-a6a67664/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ezeilo-su/enumerable_methods_in_ruby/issues)

## Show your support

Show support by giving a ⭐️ if you like this project!
