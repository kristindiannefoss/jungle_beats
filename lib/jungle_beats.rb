require './lib/node'
require 'pry'

class JungleBeats
  attr_reader :head, :next_node, :data
  def initialize(data)
    @head = Node.new(data)
    @accepted = "tee dee deep beep bop boop la na"
    @beats = []
  end

  def play
    'say -r 500 -v Boing #{all}'
  end

  def validate(beats)
    @proceed = beats.split.select do |beat|
      @accepted.include?(beats)
      end
      if @proceed.count < 1
        ""
      else
      @proceed.join(" ")
    end
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
    new_beats = validate(data)
    if @head.nil?
      @head = Node.new(new_beats)
    else
      tail.next_node = Node.new(new_beats)
    end
  end

  def all
    current_node = @head
    until current_node.nil?
      @beats << current_node.data
      current_node = current_node.next_node
    end
    @beats.join(" ").strip
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
    new_beats = validate(data)
    new_node = Node.new(new_beats)
    new_node.next_node = @head
    @head = new_node
    split_beats(new_beats).count
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
    if validate(data) == ""
      all
    else
    new_beats = validate(data).strip
    i = number - 1
    current_node = @head
    i.times do
    current_node = current_node.next_node
      end
    temp_node = current_node.next_node
    current_node.next_node = Node.new(new_beats)
    current_node.next_node.next_node = temp_node
    all
    end
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
end
