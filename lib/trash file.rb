require_relative 'elephant'

class ElephantLine  #JungleBeat

  attr_accessor :head_elephant #:last_elephant

  def initialize (value)
    @head_elephant = Elephant.new(value) #HEAD
  end
  def initialize(value)
    @head_elephant = Elephant.new(value)
    @count = 0
    @empty = empty
    # ElephantLine.new("one")
      # head should become an Elephant containing "one"
    # ElephantLine.new("one two three")
      # head should be Elephant containing "one"
      # head: whos_your_linked_elephant -> Another Elephant holding "two"
      # that elephant should be linked to another elephant holding "three"
    value.split.each do |word|
      append(word)
    end
  end
  def append(value)
    # give me any arbitrary data and I'll give it to an elephant

  def find_tail_elephant #TAIL
    current_elephant = @head_elephant #current_elephant is where we are looking, asking, @head_elephantis who we are asking first, we look at the first elephant in line to ask it a question
    unless current_elephant.whos_your_linked_elephant.nil? #unless that elephant has no next elephant, that is the tail elephant
      current_elephant = current_elephant.whos_your_linked_elephant
      #moves down the line
    end
      current_elephant #then it returns the value of the found last elephant that is the current elephant we're looking at.
      # @first_elephant_in_line = current_elephant
  end

  def append (value)
    newborn_elephant = Elephant.new(value) #first we need to make a new elephant instance to add on, takes a noise as it's arguement/parameter
    #self.
    find_tail_elephant.whos_your_linked_elephant = newborn_elephant
    # return, isn't needed, only in the middle, not needed when it's the last thing in the method.  Telling the tail what to grab onto, here, new elephant instance, "elen"
    noise.split.count
  end

  def prepend (value)
    newborn_elephant = Elephant.new(value) #create a new Elephant,
    newborn_elephant.whos_your_linked_elephant = @head_elephant #now call whos_your_linked_elephant and set that answer to @head_elephant, which makes him the new head. = sets it
    @head_elephant = newborn_elephant #now the new elephant, steve is the head
    noise.split.count
    #tell steve that his next elephant will be the head elephant that we have @head_elephant, then we can tell head elephant, you're not that elephant, you're steve
  end

  def display_all
    newborn_elephant = Elephant.new(value)
    noise.split
    list = elephant.each do
    newborn_elephant.whos_your_linked_elephant

  end

  def insert (position, value)
    music = []
    newborn_elephant = Elephant.new(value) do |value|
      music << value.split
      music.to_s
  end
    #asks head elephant to ask the next elephant how many there are before it until it is nil

    #then returns that number in count
    #must then have a counter and store the value, but must be changable,
end

# def insert (position, value)
#   roll_call = []
#   newborn_elephant = Elephant.new(value) do |value|
#     roll_call << value.split
#     roll_call.count[size.to_i]
#     roll_call.index[x] do
#     x = (0..x)
#     end
#     roll_call.to_s
# end





    newborn_elephant = Elephant.new(value)
    value.split
    self.find_tail_elephant.whos_your_linked_elephant = newborn_elephant
    value.split.count
  end

  # def digest(value)
  #   array = []
  #   if value.split.count == 1
  #     append(value)
  #   else
  #     value.split.each do |word|
  #     array << word
  #     # list.append(value)
  #     end
  #   end
  #   @show_all_elephants = show_all_elephants
  # end



  # newborn_elephant = Elephant.new(value)
  # line = @show_all_elephants.to_a
  # search = line.find do |word|
  #   word == (value)
  #   search
  # end
  #   if search == (value)
  #     false
  #   else
  #     true
  #   end
end
def includes?(data)
temp = @head
until temp == nil
  return true if temp.data == data
  temp = temp.link
end
false
end
#   roll_call = [@show_all_elephants]
#   newborn_elephant = Elephant.new(value)
#   roll_call.each do |thing|
#
#   thing.whos_your_linked_elephant << roll_call
#   end
#   if
#   roll_call.index(value) >= 1
#     true
#   else
#     false
#   end
# end


def remove(amount)
  # ellen = Elephant.new(value)
  # @show_all_elephants
  # current_elephant = @head_elephant
  # roll_call = []
  # ousted = []
  # roll_call << @show_all_elephants
  # ousted << (amount).times do roll_call.pop end
  # ousted


  def show_all_elephants
    newborn_elephant = Elephant.new(value)


    # roll_call = []
    # current_elephant = @head_elephant
    # until current_elephant.whos_your_linked_elephant.nil?
    #   # current_elephant
    #   roll_call << current_elephant.mouth_holds
    #   current_elephant = current_elephant.whos_your_linked_elephant

    end
      roll_call.join(" ")

      def let_me_in_right_there (position, value)
        # roll_call = []
        # roll_call << @show_all_elephants
        # roll_call.insert(position)
        # roll_call.to_s.join(" ")


        def show_all_elephants
          # newborn_elephant = Elephant.new(value)
          # current_elephant = @head_elephant
          # until current_elephant.whos_your_linked_elephant == nil
          #   return current_elephant.mouth_holds
          #   current_elephant = current_elephant.whos_your_linked_elephant
          #   current_elephant.mouth_holds
          # newborn_elephant = Elephant.new(value)
          roll_call = []
          current_elephant = @head_elephant
          until current_elephant.nil?
            # binding.pry
            # current_elephant
            roll_call << current_elephant.mouth_holds
            current_elephant = current_elephant.whos_your_linked_elephant
          end
          roll_call.join(" ")
