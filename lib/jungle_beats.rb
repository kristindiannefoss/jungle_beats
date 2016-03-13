require './lib/node'
require 'pry'

class JungleBeats
  attr_reader :head, :next_node, :data, :current_node
  def initialize(data)
    @head = Node.new(data)
    @accepted = "tee dee deep beep bop boop la na"
    @beats = []
    @current_node = current_node
  end

  def validate(beats)
    @proceed = beats.split.select {|beat| @accepted.include?(beats)}
      if @proceed.count < 1
        ""
      else
      @proceed.join(" ")
    end
  end

  def tail
    @current_node = @head
      until @current_node.next_node.nil?
        move_one
      end
      @current_node
  end

  def split_beats(beat_chunk)
    beat_chunk.split.each {|beat_chunk| @beats << beat_chunk}
    @beats
  end

  def append(data)
    new_beats = validate(data)
    if @head.nil?
      @head = Node.new(new_beats)
    else
      tail.next_node = Node.new(new_beats)
    end
  end

  def all
    @current_node = @head
    until current_node.nil?
      @beats << @current_node.data
      move_one
    end
    @beats.join(" ").strip
  end

  def count
    @current_node = @head
    iterator_count = 1
    until @current_node.next_node.nil?
      iterator_count += 1
      move_one
    end
    iterator_count
  end

  def prepend(data)
    new_beats = validate(data)
    new_node = Node.new(new_beats)
    new_node.next_node = @head
    @head = new_node
    split_beats(new_beats).count
  end

  def include?(data)
    @current_node = @head
    while current_node.data != data
      move_one
      if @current_node.data == data
        return true
      else
        return false
      end
    end
  end

  def insert(number, data)
    if validate(data) == ""
      all
    else
    new_beats = validate(data).strip
    i = number - 1
    @current_node = @head
    i.times {move_one}
    temp_node = @current_node.next_node
    @current_node.next_node = Node.new(new_beats)
    @current_node.next_node.next_node = temp_node
    all
    end
  end

  def delete_one
  @current_node = @head
    until @current_node.next_node.next_node.nil?
      move_one
    end
    temp_node = @current_node.next_node
    @current_node.next_node = nil
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
    @current_node = @head
    number.times {@current_node = @current_node.next_node}
    @result = ""
    quantity.times do
      move_one
      @result += ("#{current_node.data}"+ " ")
      end
    @result.strip
  end

  def move_one
    @current_node = @current_node.next_node
  end
end
