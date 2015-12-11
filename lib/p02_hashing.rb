class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  #given an array, generate a unique hash value
  def hash
    hash_values = []

    return Time.now.to_i if empty?

    self.each_with_index do |element, index|
      if element.is_a?(Fixnum)
        hash_values << (element + index).hash
      end
    end

    hash_values.inject(:+)
  end
end

class String
  def hash
  end
end

class Hash
  def hash
  end
end
