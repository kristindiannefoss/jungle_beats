require_relative 'elephant'
require 'pry'

class ElephantLine
  attr_accessor :head_elephant

  def initialize(value)
    @find_tail_elephant
    @show_all_elephants
    @count = 0
    @empty = empty?
    value.split.each do |word|
      append(word)
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
    if @head_elephant.nil?
      @head_elephant = Elephant.new(value)
    else
      # binding.pry
      current_elephant = @head_elephant
      # current_elephant.find_tail_elephant
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
  #ALL
  def show_all_elephants
    roll_call = []
    current_elephant = @head_elephant
    until current_elephant.nil?
      # binding.pry
      # current_elephant
      roll_call << current_elephant.mouth_holds
      current_elephant = current_elephant.whos_your_linked_elephant
    end
    roll_call.join(" ")
  end

  #INSERT
  def let_me_in_right_there (position, value)
    # @show_all_elephants
    roll_call = []
    current_elephant = @head_elephant
    until current_elephant.nil?
      # current_elephant
      roll_call << current_elephant.mouth_holds
      current_elephant = current_elephant.whos_your_linked_elephant
    end


    # roll_call = []
    # ousted = []
    # roll_call << @show_all_elephants
    # ousted << (amount).times do roll_call.pop end
    # ousted

    # roll_call = []
    # roll_call << @show_all_elephants
    # roll_call.insert(position)
    # roll_call.join(" ")


  end
  #INCLUDE?
  def include?(value)
    current_elephant = @head_elephant
    until current_elephant.whos_your_linked_elephant == nil
      current_elephant = current_elephant.whos_your_linked_elephant
      return true if current_elephant.mouth_holds == value
    end
    false
  end
  #POP
  def remove(amount)
    ousted = []
    # current_elephant = @head_elephant
    if empty?
      "cannot oust an elephant from a list of zero elephants"
    else
      current_elephant = @head_elephant
      (amount).times do
          @find_tail_elephant
          current_elephant = current_elephant.whos_your_linked_elephant
          ousted << current_elephant.mouth_holds
          end
        # ousted << current_elephant.mouth_holds
    end
    ousted.join(" ")
  end

  def empty?
    @head_elephant.nil?
  end

  def counting_phants

  end
end
