require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hash_value = key.hash
    bucket_number = hash_value % num_buckets
    @store[bucket_number] << key
    @count += 1
    resize! if count == num_buckets
  end

  def include?(key)
    hash_value = key.hash
    bucket_number = hash_value % num_buckets
    @store[bucket_number].include?(key)
  end

  def remove(key)
    hash_value = key.hash
    bucket_number = hash_value % num_buckets
    @store[bucket_number].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
