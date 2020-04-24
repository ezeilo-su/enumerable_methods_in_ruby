module Enumerable
  def my_each
    return enum_for if block_given? == false

    for i in 0...self.length
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    return enum_for if block_given? == false

    for i in 0...self.length
      yield(self[i], i)
    end
    self
  end

  def my_select
    return enum_for if block_given? == false

    new_arr = []
    my_each do |n|
      new_arr << n if yield(n)
    end
    new_arr
  end
end

even_num_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_select { |x| x % 2 == 0 }
puts even_num_arr.to_s
