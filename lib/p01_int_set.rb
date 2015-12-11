require 'byebug'

class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
  end

  private

  def is_valid?(num)
    return true if num < @store.length && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] == true
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_number = num % num_buckets
    @store[bucket_number] << num
  end

  def remove(num)
    bucket_number = num % num_buckets
    @store[bucket_number].delete(num)
  end

  def include?(num)
    bucket_number = num % num_buckets
    @store[bucket_number].include?(num) ? true : false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    bucket_number = num % num_buckets
    @store[bucket_number] << num
    @count += 1
    resize! if count == num_buckets
  end

  def remove(num)
    bucket_number = num % num_buckets
    @count -= 1
    @store[bucket_number].delete(num)
  end

  def include?(num)
    bucket_number = num % num_buckets
    @store[bucket_number].include?(num) ? true : false
  end


  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!

    old_store = @store
    @store = Array.new(num_buckets * 2) { [] }
  
    old_store.each do |bucket|
      bucket.each do |num|
        self.insert(num)
      end
    end
  end

end

set = ResizingIntSet.new(4)
#5.times { |i| set.insert(i) }
# p set.store
# p set.store
# elements = (20..30).to_a
# elements.each { |el| set.insert(el) }
#p set.store
