class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
  end

  def empty?
    @head.next == nil
  end

  def get(key)
    node = first
    until node.key == key
      return nil if node.next == nil
      node = node.next
    end
    node.val
  end

  def include?(key)
    get(key) ? true : false
  end

  def insert(key, val)
    new_node = Link.new(key, val)

    if first.nil?
      head.next = new_node
    else
      node = first

      until node.next.nil?
        node = node.next
      end
      node.next = new_node
    end
  end

  def remove(key)
    node = head
    until node.next.key == key
      node = node.next
    end
    node_to_delete = node.next

    #node is now the node previous to the one we want to delete
    node.next = node_to_delete.next
    node_to_delete.next = nil
  end

  def each(&prc)
    node = first
    until node.next.nil?
      prc.call(node)
      node = node.next
    end
    prc.call(node)
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
