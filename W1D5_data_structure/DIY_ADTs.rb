class Stack
    attr_accessor  :arr, :push
    def initialize
        # create ivar to store stack here!
        @arr = []
    end

    def push(el)
        # adds an element to the stack
        arr << el
    end

    def pop
        arr.pop
      # removes one element from the stack
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      arr.last
    end
  
end

class Queue
  attr_reader :arr

  def initialize
    @arr = []
  end

  def enqueue(el)
    @arr.unshift(el)
  end

  def dequeue
    @arr.pop
  end

  def peek
    @arr.last
  end
end

class Map
    attr_reader :arr
    def initialize
        @arr = Array.new { Array.new }
    end

    def set(key,value)
        pair_index = @arr.index { |pair| pair[0] == key }
        if pair_index
            arr[pair_index][1] = value
        else
            arr.push([key, value])
        end
        value
    end

    def get(key)
        @arr.each do |sub|
            return sub[1] if sub[0] == key
        end
        nil
    end

    def delete(key)
        @arr.each do |sub|
            @arr.delete(sub) if sub[0] == key
        end
    end

    def show
        deep_dup(arr)
    end

    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end  
end