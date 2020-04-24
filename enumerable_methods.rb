module Enumerable
  def my_each
    return enum_for if block_given? == false

    for i in 0...self.length
      yield(self[i])
    end
    self
  end
end

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_each { |x| puts "elm_#{x}" }
