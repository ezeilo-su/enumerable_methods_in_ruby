require_relative '../enumerable_methods.rb'

describe Enumerable do
  let(:example_array) { [2, 4, 6, 8] }
  let(:example_range) { (1...5) }
  let(:rand_num) { rand(5) }
  let(:test_block) { proc { |element| element.even? } }

  describe '#my_each' do
    context 'when invoked with a block' do
      it 'returns an array when invoked on array' do
        expect(example_array.my_each { test_block }).to eql(example_array.each { test_block })
      end

      it 'returns an range when invoked on a range' do
        expect(example_range.my_each { test_block }).to eql(example_range.each { test_block })
      end
    end

    context 'when invoked without a block' do
      it 'returns an array enumerator when invoked on an array' do
        expect(example_array.my_each.class).to eql(example_array.each.class)
      end

      it 'returns a range enumerator when invoked on a range' do
        expect(example_range.my_each.class).to eql(example_range.each.class)
      end
    end
  end

  describe '#my_each_with_index' do
    context 'when invoked with a block' do
      it 'returns an array when invoked on array' do
        expect(example_array.my_each_with_index { test_block }).to eql(example_array.each_with_index { test_block })
      end

      it 'returns an range when invoked on a range' do
        expect(example_range.my_each_with_index { test_block }).to eql(example_range.each_with_index { test_block })
      end
    end

    context 'when invoked without a block' do
      it 'returns an array enumerator when invoked on an array' do
        expect(example_array.my_each_with_index.class).to eql(example_array.each_with_index.class)
      end

      it 'returns a range enumerator when invoked on a range' do
        expect(example_range.my_each_with_index.class).to eql(example_range.each_with_index.class)
      end
    end
  end

  describe '#my_select' do
    context 'when invoked with a block' do
      it 'returns an array of values that yield true when invoked on array' do
        expect(example_array.my_select { test_block }).to eql(example_array.select { test_block })
      end

      it 'returns an array of values that yield true when invoked on a range' do
        expect(example_range.my_select { test_block }).to eql(example_range.select { test_block })
      end
    end

    context 'when invoked without a block' do
      it 'returns an array enumerator when invoked on an array' do
        expect(example_array.my_select.class).to eql(example_array.select.class)
      end

      it 'returns a range enumerator when invoked on a range' do
        expect(example_range.my_select.class).to eql(example_range.select.class)
      end
    end
  end

  describe '#my_all?' do
    context 'when invoked with only a block' do
      it 'returns true if all elements in the array yield true; otherwise, false' do
        expect(example_array.my_all? { test_block }).to eql(example_array.all? { test_block })
      end

      it 'returns true if all elements in the range yield true; otherwise, false' do
        expect(example_range.my_all? { test_block }).to eql(example_range.all? { test_block })
      end
    end

    context 'when invoked with only an argument' do
      it 'returns true if the argument equals all the elements in the array; otherwise, false' do
        expect(example_array.my_all?(rand_num)).to eql(example_array.all?(rand_num))
      end

      it 'returns true if the argument equals all the elements in the range; otherwise, false' do
        expect(example_range.my_all?(rand_num)).to eql(example_range.all?(rand_num))
      end
    end

    context 'when invoked with a block and an argument' do
      it 'neglects the block and use the argument' do
        expect(example_array.my_all?(rand_num) { test_block }).to eql(example_array.all?(rand_num) { test_block })
      end

      it 'neglects the block and use the argument' do
        expect(example_range.my_all?(rand_num) { test_block }).to eql(example_range.all?(rand_num) { test_block })
      end
    end

    context 'when invoked with no block and no argument' do
      it 'returns true if all element of the array are truthy; otherwise, false' do
        expect(example_array.my_all?).to eql(example_array.all?)
      end

      it 'returns true if all element in the range are truthy; otherwise, false' do
        expect(example_range.my_all?).to eql(example_range.all?)
      end
    end

    context 'when invoked with a RegEx argument' do
      it 'should return true if all elements match with a RegEx' do
        expect(['a', 'a', 'a', 'a'].my_all?(/a/)).to eql(true)
      end

      it 'should not return true if all array elements do not match with a RegEx ' do
        expect(['a', 2, 3, 'd'].my_all?(/d/)).not_to eql(true)
      end
    end  
  end

  describe '#my_any?' do
    context 'when invoked with only a block' do
      it 'returns true if any elements in the array yield true; otherwise, false' do
        expect(example_array.my_any? { test_block }).to eql(example_array.any? { test_block })
      end

      it 'returns true if any elements in the range yield true; otherwise, false' do
        expect(example_range.my_any? { test_block }).to eql(example_range.any? { test_block })
      end
    end

    context 'when invoked with only an argument' do
      it 'returns true if the argument equals any the elements in the array; otherwise, false' do
        expect(example_array.my_any?(rand_num)).to eql(example_array.any?(rand_num))
      end

      it 'returns true if the argument equals any the elements in the range; otherwise, false' do
        expect(example_range.my_any?(rand_num)).to eql(example_range.any?(rand_num))
      end
    end

    context 'when invoked with a block and an argument' do
      it 'neglects the block and use the argument' do
        expect(example_array.my_any?(rand_num) { test_block }).to eql(example_array.any?(rand_num) { test_block })
      end

      it 'neglects the block and use the argument' do
        expect(example_range.my_any?(rand_num) { test_block }).to eql(example_range.any?(rand_num) { test_block })
      end
    end

    context 'when invoked with no block and no argument' do
      it 'returns true if any element of the array are truthy; otherwise, false' do
        expect(example_array.my_any?).to eql(example_array.any?)
      end

      it 'returns true if any element in the range are truthy; otherwise, false' do
        expect(example_range.my_any?).to eql(example_range.any?)
      end
    end

    context 'when invoked with a RegEx argument' do
      it 'should return true if there is at least a match with RegEx' do
        expect([1, 2, 'd'].my_any?(/d/)).to eql(true)
      end

      it 'should not return true if there is no match with RegEx ' do
        expect([1, 2, 3].my_any?(/d/)).not_to eql(true)
      end
    end    
  end

  describe '#my_none?' do
    context 'when invoked with only a block' do
      it 'returns true if no elements in the array yield true; otherwise, false' do
        expect(example_array.my_none? { test_block }).to eql(example_array.none? { test_block })
      end

      it 'returns true if no elements in the range yield true; otherwise, false' do
        expect(example_range.my_none? { test_block }).to eql(example_range.none? { test_block })
      end
    end

    context 'when invoked with only an argument' do
      it 'returns true if the argument does not equals any of the elements in the array; otherwise, false' do
        expect(example_array.my_none?(rand_num)).to eql(example_array.none?(rand_num))
      end

      it 'returns true if the argument does not equals any of the elements in the range; otherwise, false' do
        expect(example_range.my_none?(rand_num)).to eql(example_range.none?(rand_num))
      end
    end

    context 'when invoked with a block and an argument' do
      it 'neglects the block and use the argument' do
        expect(example_array.my_none?(rand_num) { test_block }).to eql(example_array.none?(rand_num) { test_block })
      end

      it 'neglects the block and use the argument' do
        expect(example_range.my_none?(rand_num) { test_block }).to eql(example_range.none?(rand_num) { test_block })
      end
    end

    context 'when invoked with no block and no argument' do
      it 'returns false if the array contains at least one truthy value; otherwise, true' do
        expect(example_array.my_none?).to eql(example_array.none?)
      end

      it 'returns false if the range contains at least one truthy value; otherwise, true' do
        expect(example_range.my_none?).to eql(example_range.none?)
      end
    end
  end

  describe '#my_count' do
    context 'when invoked with only a block' do
      it 'returns the number of elements in the array for which the given block yields true' do
        expect(example_array.my_count { test_block }).to eql(example_array.count { test_block })
      end

      it 'returns the number of elements in the range for which the given block yields true' do
        expect(example_range.my_count { test_block }).to eql(example_range.count { test_block })
      end
    end

    context 'when invoked with only an argument' do
      it 'returns the number of elements in the array that equals the given argument' do
        expect(example_array.my_count(rand_num)).to eql(example_array.count(rand_num))
      end

      it 'returns the number of elements in the range that equals the given argument' do
        expect(example_range.my_count(rand_num)).to eql(example_range.count(rand_num))
      end
    end

    context 'when invoked with a block and an argument' do
      it 'neglects the block and use the argument' do
        expect(example_array.my_count(rand_num) { test_block }).to eql(example_array.count(rand_num) { test_block })
      end

      it 'neglects the block and use the argument' do
        expect(example_range.my_count(rand_num) { test_block }).to eql(example_range.count(rand_num) { test_block })
      end
    end

    context 'when invoked with no block and no argument' do
      it 'returns the number of elements in the array' do
        expect(example_array.my_count).to eql(example_array.count)
      end

      it 'returns the number of elements in the range' do
        expect(example_range.my_count).to eql(example_range.count)
      end
    end
  end

  describe '#my_map' do
    context 'when invoked with a block' do
      it 'returns an array when invoked on array' do
        expect(example_array.my_map { test_block }).to eql(example_array.map { test_block })
      end

      it 'returns an range when invoked on a range' do
        expect(example_range.my_map { test_block }).to eql(example_range.map { test_block })
      end
    end

    context 'when invoked without a block' do
      it 'returns an array enumerator when invoked on an array' do
        expect(example_array.my_map.class).to eql(example_array.map.class)
      end

      it 'returns a range enumerator when invoked on a range' do
        expect(example_range.my_map.class).to eql(example_range.map.class)
      end
    end

    context 'when invoked with a block and an argument' do
      let(:my_proc) { proc { |x| x * 2 } }
      it 'returns an array when invoked on array, ignores the block and use the argument' do
        expect(example_array.my_map(my_proc) { test_block }).to eql(example_array.map(&my_proc))
      end

      it 'returns a range when invoked on a range, ignores the block and use the argument' do
        expect(example_range.my_map(my_proc) { test_block }).to eql(example_range.map(&my_proc))
      end
    end
  end

  describe '#my_inject' do
    context 'when invoked with a symbol but without an accumulator' do
      it 'returns the computed result when invoked on an array' do
        expect(example_array.my_inject(:+)).to eql(example_array.inject(:+))
      end

      it 'returns the computed result when invoked on a range' do
        expect(example_range.my_inject(:+)).to eql(example_range.inject(:+))
      end
    end

    context 'when invoked with an accumulator and a symbol' do
      it 'returns the computed result when invoked on an array' do
        expect(example_array.my_inject(rand_num, :+)).to eql(example_array.inject(rand_num, :+))
      end

      it 'returns the computed result when invoked on a range' do
        expect(example_range.my_inject(rand_num, :+)).to eql(example_range.inject(rand_num, :+))
      end
    end

    context 'when invoked with a block and no accumulator' do
      let(:block) { proc { |acc, n| acc + n } }

      it 'returns the computed result when invoked on an array' do
        expect(example_array.my_inject { block }).to eql(example_array.inject { block })
      end

      it 'returns the computed result when invoked on a range' do
        expect(example_range.my_inject { block }).to eql(example_range.inject { block })
      end
    end

    context 'when invoked with a block and an accumulator' do
      let(:block) { proc { |acc, n| acc + n } }

      it 'returns the computed result when invoked on an array' do
        expect(example_array.my_inject(rand_num) { block }).to eql(example_array.inject(rand_num) { block })
      end

      it 'returns the computed result when invoked on a range' do
        expect(example_range.my_inject(rand_num) { block }).to eql(example_range.inject(rand_num) { block })
      end
    end

    context 'when invoked without a block' do
      it 'raises an error when invoked on an array' do
        expect { example_array.my_inject }.to raise_error(LocalJumpError, 'no block given (yield)')
      end

      it 'raises an error when invoked on a range' do
        expect { example_range.my_inject }.to raise_error(LocalJumpError, 'no block given (yield)')
      end
    end
  end
end
