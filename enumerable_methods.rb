module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for i in self
      yield i
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    ind = 0
    for i in self
      yield(i, ind)
      ind += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    new_arr = []
    my_each do |n|
      new_arr << n if yield(n)
    end
    new_arr
  end

  def arg?(item, arg)
    return item.is_a? arg if arg.is_a? Class
    return !(item =~ arg).nil? if arg.is_a? Regexp

    item == arg
  end

  def my_all?(arg = nil)
    my_each do |item|
      case block_given?
      when false
        (return false unless item) unless arg
        (return false unless arg?(item, arg)) if arg
      else
        return false unless yield(item)
      end
    end
    true
  end

  def my_any?(arg = nil)
    my_each do |item|
      case block_given?
      when false
        return true if !arg && item
        return true if arg && is_arg?(item, arg)
      else
        return true if yield(item)
      end
    end
    false
  end

  def my_none?(arg = nil)
    my_each do |item|
      case block_given?
      when false
        return false if !arg && item
        return false if arg && is_arg?(item, arg)
      else
        return false if yield(item)
      end
    end
    true
  end

  def my_count(arg = nil)
    counter = 0
    if !arg.nil?
      my_each do |n|
        counter += 1 if n == arg
      end
    elsif block_given?
      my_each do |n|
        counter += 1 if yield(n)
      end
    else
      counter = self.length
    end
    counter
  end

=begin
  def my_map
    return to_enum(:my_map) unless block_given?

    new_arr = []
    my_each do |n|
      new_arr << yield(n)
    end
    new_arr
  end
=end

  # my_map modified to accept either block or proc (i.e., a named block)

  def my_map(my_proc = nil)
    return to_enum(:my_map) unless block_given?

    new_arr = []
    my_each_with_index do |n, ind|
      new_arr[ind] = my_proc.nil? ? yield(n) : my_proc.call(n)
    end
    new_arr
  end

  def binary_operation(acc, num, bin_op)
    case bin_op
    when :+ then acc += num
    when :- then acc -= num
    when :* then acc *= num
    when :/ then acc /= num
    when :** then acc **= num
    when :% then acc %= num
    end
    acc
  end

  def my_inject(acc = nil, symbol = nil)
    # %i[+ - * / ** %].my_any?(acc)
    # ignore any passed block if with both symbol and starting value
    arr = self.to_a
    if acc && symbol
      arr.my_each { |n| acc = binary_operation(acc, n, symbol) }
    elsif !block_given? && %i[+ - * / ** %].my_any?(acc)
      symbol = acc
      acc = arr[0]
      arr.drop(1).my_each { |n| acc = binary_operation(acc, n, symbol) }
    elsif acc
      arr.my_each { |n| acc = yield(acc, n) }
    else
      acc = arr[0]
      arr.drop(1).my_each { |n| acc = yield(acc, n) }
    end
    acc
  end
end

def multiply_els(arr)
  arr.my_inject(1) { |result_memo, n| result_memo * n }
end

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
