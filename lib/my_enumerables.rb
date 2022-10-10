module Enumerable
  # Your code goes here
  def my_each_with_index
    puts "my_each_with_index invoked"
    return self unless block_given?
    i = 0 
    for item in self do
      yield(item, i)
      i += 1
    end
  end  

  def my_select
    puts "my_select invoked"
    new_array = []
    self.my_each do |item| # using my own array method    
        new_array << item if yield(item)
    end  
  end 

  def my_all?
    puts "my_all? invoked"
    self.my_each do |item| # using my own array method  
      return false while yield(item) == false
    end
    true # only evaluates if no false values cause it to return
  end 

  def my_any?
    puts "my_any? invoked"
    self.my_each do |item| # using my own array method  
      return true while yield(item) == true
    end
    false # only evaluates if no true values cause it to return
  end 

  def my_none?
    puts "my_none? invoked"
    self.my_each do |item| # using my own array method  
      return false while yield(item) == true
    end
    true # only evaluates if no true values cause it to return
  end 

  def my_count
    puts "my_count invoked"
    # if NO block, then
    if !block_given?
      return self.length
    else   # if YES block, then yield to block
      new_array = []
      self.my_each do |item| # using my own array method  
      new_array << item if yield(item)
      end
    end
      new_array.length
  end 

  def my_map
    puts "my_map invoked"
    new_array = []
    self.my_each do |item| # using my own array method  
      new_array << yield(item)
    end
    new_array
  end 

  def my_inject(initial_value)
    puts "my_inject invoked"
    sum = initial_value
    self.my_each do |item| # using my own array method  
      sum = yield(sum, item)
    end
    sum
  end 
end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self unless block_given?
    for item in self do
      yield item
    end
  end

end


# My list of suspected tasks from the lesson:
# - make and use at least 1 proc
# - make and use at least 1 lamda
# - YES - use at least 1 yield
# - use at least 1 &
# - use at least 1 pattern matching case/in statement
#  - and use at least 1 Variable Pattern
# Extra credit, 
# - use at least 1 binding?
# - use pin operator
# - YES - at least 1 guard condition
# - Find Pattern