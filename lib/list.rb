require './lib/node'
require 'pry'

class List
  attr_reader :head, :next_node, :data
  def initialize(data)
    @head = Node.new(data)
    @beats = []
    @string = ""
    @result = nil
    @result2 = nil
    @hold = []
  end

  def tail
    temp_node = @head
      until temp_node.next_node.nil?
        temp_node = temp_node.next_node
      end
      temp_node
  end

  def split_beats(beat_chunk)
    beat_chunk.split.each do |beat_chunk|
      @beats << beat_chunk
      # binding.pry
    end
    @beats
  end

  def append(data)
      if @head.nil?
        @head = Node.new(data)
      else
        tail.next_node = Node.new(data)
      end
  end

  # def append(data)
  #   split_beats(data).each do
  #       new_node = Node.new(data)
  #     if @head.nil?
  #       @head = new_node
  #     else
  #       tail.next_node = new_node
  #     end
  #   end
  # end

  def all
    temp_node = @head
    until temp_node.nil?
      @beats << temp_node.data
      temp_node = temp_node.next_node
    end
    @beats.join(" ")
  end

  def count
    temp_node = @head
    iterator_count = 1
    until temp_node.next_node.nil?
      iterator_count += 1
      temp_node = temp_node.next_node
    end
    iterator_count
  end

  def prepend(data)
    new_node = Node.new(data)
    new_node.next_node = @head
    @head = new_node
    split_beats(data).count
  end


  def include?(data)
    current_node = @head
    while current_node.data != data
      current_node = current_node.next_node
      if current_node.data == data
        return true
      else
        return false
      end
    end
  end

  def insert(number, data)
    i = number - 1
    current_node = @head
    i.times do
    current_node = current_node.next_node
      end
    temp_node = current_node.next_node
    current_node.next_node = Node.new(data)
    current_node.next_node.next_node = temp_node
    all
  end

  def pop(number)
    popped = ""
    number.times do
      popped << delete_one + " "
    end
    popped.strip #.join(" ")
  end

  def find(number, quantity)
    @string = ""
    current_node = @head
    number.times do
        current_node = current_node.next_node
      end
    @result = ""
    quantity.times do
      current_node = current_node.next_node
      @result += ("#{current_node.data}"+ " ")
      end
    @result.strip
  end

  def delete_one
    current_node = @head
      until current_node.next_node.next_node.nil?
        current_node = current_node.next_node
      end
      temp_node = current_node.next_node
      current_node.next_node = nil
      temp_node.data
  end

  def move_links
    current_node = current_node.next_node
  end
end
