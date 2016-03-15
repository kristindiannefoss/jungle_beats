require './lib/node'
require 'pry'

class JungleBeats
  attr_reader :head, :next_node, :beats, :tail
  ACCEPTED = ["tee", "dee", "deep", "beep", "bop", "boop", "la", "na"]

  def initialize(beats)
    @head = Node.new(beats)
  end

  def validate(beats)
    beats.split.select {|beat| ACCEPTED.include?(beat)}
  end

  def make_new_node(beats)
    node_pod = []
    node_seeds = validate(beats)
    node_seeds.each do |beat|
                  node_pod << Node.new(beat)
                end
    node_pod
  end

  def tail
    current_node = @head
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
        current_node
  end

  def split_beats(beat_chunk)
    validate(beat_chunk).split.each {|beat| beats << beat}
    beats
  end

  def append(beats)
      make_new_node(beats).each do |node|
      if @head.nil?
        @head = node
      else
        tail.next_node = node
      end
    end
    make_new_node(beats).count
  end

  def all
    beats = []
    current_node = @head
    until current_node.nil?
      beats << current_node.beats
      current_node = current_node.next_node
    end
    beats.compact.join(" ").strip
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

  def prepend(beats)
      nodes = make_new_node(beats)
      nodes.each do |node|
      node.next_node = @head
      @head = node
    end
      nodes.count
  end

  def include?(beats)
    current_node = @head
    while current_node.beats != beats
      current_node = current_node.next_node
      if current_node.beats == beats
        return true
      else
        return false
      end
    end
  end

  def insert(number, beats)
    nodes = make_new_node(beats)
    nodes.each do |node|
      i = number - 1
      current_node = @head
      i.times {current_node = current_node.next_node}
      temp_node = current_node.next_node
      current_node.next_node = node
      node.next_node = temp_node
    end
    all
  end

  def delete_one
  current_node = @head
    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    temp_node = current_node.next_node
    current_node.next_node = nil
    temp_node.beats.split
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
    if number > count - quantity
      "cannot find these nodes, list is too short"
    else
      @string = ""
      current_node = @head
      number.times {current_node = current_node.next_node}
      @result = ""
      quantity.times do
        current_node = current_node.next_node
        @result += ("#{current_node.beats}"+ " ")
        end
      @result.strip
    end
  end

  def play
    `say -r 500 -v Boing #{all}`
    count
  end
end

if __FILE__ == $0
new_list = JungleBeats.new("bop la na tee bop la na tee bop la na tee")

new_list.play
end
