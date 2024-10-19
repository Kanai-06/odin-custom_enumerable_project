module Enumerable
  # Your code goes here
  
  def my_each_with_index
    for i in 0...self.length do
      yield(self[i], i)
    end

    return self
  end

  def my_select
    output = []
    
    for i in 0...self.length do
      output.push(self[i]) if yield(self[i])
    end

    output
  end

  def my_all?
    for i in 0...self.length do
      return false unless yield(self[i])
    end

    true
  end

  def my_any?
    for i in 0...self.length do
      return true if yield(self[i])
    end

    false
  end

  def my_none?
    for i in 0...self.length do
      return false if yield(self[i])
    end

    true
  end

  def my_count
    if block_given?
      output = 0

      for i in 0...self.length do
        output += 1 if yield(self[i])
      end

      return output
    else
      self.length
    end
  end

  def my_map
    output = []

    for i in 0...self.length do
      output.push(yield(self[i]))
    end

    output
  end

  def my_inject(initial_value = (self[0] unless self.empty?))
    accumulator = initial_value
    
    for i in 0...self.length do
      accumulator = yield(accumulator, self[i])
    end

    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  
  def my_each
    for i in 0...self.length do
      yield(self[i])
    end

    return self
  end
end
