require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  #given an array, generate a unique hash value
  def hash
    hash_values = []

    return (10.hash + 1) if empty?

    self.each_with_index do |element, index|
      hash_values << element.hash * (index + 1)
    end

    hash_values.inject(:+)
  end
end

class String

  def hash
    asci_sum = 0
    string_array = []

    self.each_char do |char|
      string_array << char.ord
    end

    string_array.hash
  end

end

class Hash

  def hash
    value = 0

    hash_to_array = self.to_a.sort
    hash_to_array.each do |hash_array|
      value += hash_array.hash
    end

    value
  end

end
