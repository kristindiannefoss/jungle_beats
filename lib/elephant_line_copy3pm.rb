require_relative 'elephant'
require 'pry'

class ElephantLine

  attr_accessor :head_elephant

  def initialize (value)
    @head_elephant = Elephant.new(value)
  end

  def find_tail_elephant
    current_elephant = @head_elephant
    unless current_elephant.whos_your_linked_elephant.nil?
      current_elephant = current_elephant.whos_your_linked_elephant
    end
      current_elephant
  end

  def append(value)
    newborn_elephant = Elephant.new(value)
    value.split
    self.find_tail_elephant.whos_your_linked_elephant = newborn_elephant
    value.split.count
  end

  def prepend (value)
    newborn_elephant = Elephant.new(value)
    newborn_elephant.whos_your_linked_elephant = @head_elephant
    @head_elephant = newborn_elephant
    value.split.count
  end

  def display_all
    roll_call = []
    newborn_elephant = Elephant.new(value)
    value.split
    elephant.each do
    newborn_elephant.whos_your_linked_elephant << roll_call
    end
    roll_call.to_s
  end

  def insert (position, value)
    roll_call = []
    newborn_elephant = Elephant.new(possition, value)
    value.split
    # self.each do (position)
    newborn_elephant = roll_call.index[position]
    roll_call.to_s
  end

  def include?(value)
    roll_call = []
    newborn_elephant = Elephant.new(value)
    # value.split
    self.each do
    newborn_elephant.whos_your_linked_elephant << roll_call
    end
    if
    roll_call.index(value) >= 1
      true
    else
      false
    end
  end

  def remove(amount)
    roll_call = []
    newborn_elephant = Elephant.new(value)
    value.split
    elephant.each do
    newborn_elephant.whos_your_linked_elephant << roll_call
    end
    roll_call.last.pop
  end

end

# !> /Users/kfoss/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib/seeing_is_believing/event_stream/producer.rb:97:in `record_exception': undefined method `size' for nil:NilClass (NoMethodError)
# !> \tfrom /Users/kfoss/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib/seeing_is_believing/the_matrix.rb:40:in `block in <top (required)>'
# !> /Users/kfoss/turing/1module/projects/jungle_beats/lib/elephant_line.rb: /Users/kfoss/turing/1module/projects/jungle_beats/lib/elephant.rb:18: syntax error, unexpected end-of-input (SyntaxError)
