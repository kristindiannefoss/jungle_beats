class Node
  attr_reader   :beats
  attr_accessor :next_node
  def initialize(beats, next_node = nil)
    @beats = beats
    @next_node = next_node
  end
end
