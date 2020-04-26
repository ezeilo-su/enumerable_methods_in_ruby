## Enumerable Methods Implementation In Ruby Language

> This project implements enumerable methods in Ruby. Return values of those methods are those returned by the default ruby enumerable methods. Code usage has also been provided in this document in the "Code usage goes here" section.

> The project description can be found [here](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/archive/basic_ruby/project_advanced_building_blocks.md#project-2-enumerable-methods).

## Project Screenshots here:

## Built With

- Ruby Language

## Live Demo

[![Run on Repl.it](https://repl.it/badge/github/ezeilo-su/enumerable_methods_in_ruby)](https://repl.it/github/ezeilo-su/enumerable_methods_in_ruby)

### Code usage goes here:

```Ruby
# Test my_each method
result = ({ firstName: 'Sunday', lastName: 'Ezeilo' }.my_each { |name, val| puts "#{name}: #{val}" })
p result

# Test my_each_with_index method
result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_each_with_index { |elm, ind| puts "index*#{ind}: #{elm}" }
p result

# Test my_select method
result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_select { |elm| elm % 2 == 0 }
p result

# Test my_all? method
result = [1, 2, 3, 4, 5, 10].my_all? { |x| x < 10 }
p result

# Test my_any? method
result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_any? { |n| n < 1 }
p result

# Test my_none? method
result = [1, 2, 3, 4, 5, 10].my_none? { |x| x > 10 }
p result

# Test my_count method
p [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].my_count { |n| n % 2 == 0 }

#Test my_map method
p [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].my_map { |n| n*2 }

# Test my_map using proc instead of block
my_proc = proc { |n| n * 2 }
p [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].my_map(&my_proc)

# Test my_inject method by calling multiply_els method
p multiply_els([2, 4, 5])
p [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].my_inject(4) { |result_memo, n| result_memo + n }

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
