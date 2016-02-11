require_relative 'elephant'
require 'pry'

class ElephantLine

  attr_accessor :head_elephant

  def initialize (value)
    if value.split.count == 1
      append(value)
    else
      value.split.each do |word|
        append(word)

      end
    end
  end

  def find_tail_elephant
    current_elephant = @head_elephant
    until current_elephant.whos_your_linked_elephant.nil?
      current_elephant = current_elephant.whos_your_linked_elephant
    end
    current_elephant.mouth_holds
  end

  def append(value)
    binding.pry
    if @head_elephant.nil?
      @head_elephant = Elephant.new(value)
    else
      current_elephant = @head_elephant
      until current_elephant.whos_your_linked_elephant.nil?
        current_elephant = current_elephant.whos_your_linked_elephant
      end
      current_elephant.whos_your_linked_elephant = Elephant.new(value)
    end
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

  def show_all_elephants
    current_elephant = @head_elephant
    until current_elephant.whos_your_linked_elephant.nil?
      puts current_elephant
      current_elephant = current_elephant.whos_your_linked_elephant
    end
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
