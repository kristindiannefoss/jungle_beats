require './lib/node'
require 'pry'

class List
  attr_reader :head, :next_node, :data
  def initialize(data)
    @head = Node.new(data)
    @beats = []
    @string = ""
    @result = nil
    @popped = []
  end

  def tail
    current_node = @head
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node
  end

  def split_beats(beat_chunk)
    beat_chunk.split.each do |beat_chunk|
      @beats << beat_chunk
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

  def all
    current_node = @head
    until current_node.nil?
      @beats << current_node.data
      current_node = current_node.next_node
    end
    @beats.join(" ")
  end

  def count
    current_node = @head
    iterator_count = 1
    until current_node.next_node.nil?
      iterator_count += 1
      current_node = current_node.next_node
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

  def delete_one
  current_node = @head
    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    temp_node = current_node.next_node
    current_node.next_node = nil
    temp_node.data
  end

  def pop(number)
    if number > count - 1
        "you are trying to pop more nodes than the list contains"
    else
      popped = []
      number.times do
        popped << delete_one
      end
      popped.reverse.join(" ")
    end
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

  def move_links
    current_node = current_node.next_node
  end
end
