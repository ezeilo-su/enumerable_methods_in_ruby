module Enumerable
  def my_each
    return self.to_enum unless block_given?

    for i in self
      yield i
    end
  end

  def my_each_with_index
    return self.to_enum unless block_given?

    ind = 0
    for i in self
      yield(i, ind)
      ind += 1
    end
  end

  def my_select
    return self.to_enum unless block_given?

    new_arr = []
    my_each do |n|
      new_arr << n if yield(n)
    end
    new_arr
  end

  def my_all?(arg = nil)
    my_each do |item|
      if arg
        return false unless arg === item
      elsif !block_given?
        return false unless item
      else
        return false unless yield(item)
      end
    end
    true
  end

  def my_any?(arg = nil)
    my_each do |item|
      if arg
        return true if arg === item
      elsif !block_given?
        return true if item
      elsif yield(item)
        return true
      end
    end
    false
  end

  def my_none?(arg = nil)
    my_each do |item|
      if arg
        return false if arg === item
      elsif !block_given?
        return false if item
      elsif yield(item)
        return false
      end
    end
    true
  end

  def my_count(arg = nil)
    counter = 0
    if arg
      my_each do |n|
        counter += 1 if n == arg
      end
    elsif block_given?
      my_each do |n|
        counter += 1 if yield(n)
      end
    else
      counter = self.to_a.length
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
