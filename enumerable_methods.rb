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
