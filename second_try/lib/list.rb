require '../lib/node'

class List

  attr_accessor :head, :tail

  def initialize(value)
    @head = head
    @tail = @head #in the beginning, the tail is at the head
  end

  def find_tail
    @head = current_node
    unless current_node.link.nil?
      current_node.next.link
    end
    current_node("value")
  end

  def add(value)
    current_node = @head
    Node.new(value)
  end

end



  # def insert(node)
  #   current_node =
  #   @tail = node.next
  #   #starts at the tail,
  # end
