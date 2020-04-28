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

  def is_arg?(item, arg)
    return item.is_a? arg if arg.is_a? Class
    return !(item =~ arg).nil? if arg.is_a? Regexp

    item == arg
  end

  def my_all?(arg = nil)
    my_each do |item|
      case block_given?
      when false
        (return false unless item) unless arg
        (return false unless is_arg?(item, arg)) if arg
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

  # my_map modified to accept both proc and block
  def my_map(my_proc = nil)
    return to_enum(:my_map) unless block_given?

    new_arr = []
    my_each_with_index do |n, ind|
      new_arr[ind] = my_proc.nil? ? yield(n) : my_proc.call(n)
    end
    new_arr
  end

  def my_inject(acc = nil, symbol = nil)
    # ignore any passed block if with both symbol and starting value
    arr = self.to_a
    if acc && symbol
      arr.my_each { |n| acc = acc.send(symbol, n) }
    elsif acc && !block_given?
      symbol = acc
      acc = arr[0]
      arr.drop(1).my_each { |n| acc = acc.send(symbol, n) }
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
