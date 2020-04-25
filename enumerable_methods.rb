module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for i in self
      yield i
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    ind = 0
    for i in self
      yield(i, ind)
      ind += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    new_arr = []
    my_each do |n|
      new_arr << n if yield(n)
    end
    new_arr
  end

  def my_all?

  end

  def my_any?
    return true unless block_given?

    any = false
    my_each do |n|
      any = yield(n)
      break if any
    end
    any
  end
end

# CODE USAGE GOES HERE!

puts "\ntesting my_each method...\n"
result = ({ firstName: 'Sunday', lastName: 'Ezeilo' }.my_each { |name, val| puts "#{name}: #{val}" })
p result

puts "\ntesting my_each_with_index method...\n"
result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_each_with_index { |elm, ind| puts "index_#{ind}: #{elm}" }
p result

puts "\ntesting my_select method...\n"
result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_select { |elm| elm % 2 == 0 }
p result

puts "\ntesting my_any? method...\n"
result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_any? { |n| n < 1 }
p result
