require 'pry'
require './lib/node'
require './lib/list'

class JungleBeats
  attr_accessor :list
  def initialize(beats)
    @list = List.new(beats)
    @accepted = "tee dee deep bop boop la na"
  end

  def validate(beats)
    @proceed = beats.split.select do |beat|
      @accepted.include?(beats)
      end
      @proceed.join(" ")
  end

  # def processor(validated)
  #   validate(validated)
  # end

  def append(beats)
    validated = validate(beats)
    # binding.pry
    ready = validated.join
    @list.append(ready)
    # @list
  end

  def all
    @list.all
  end

  def prepend(beats)
    @list.prepend(beats)
  end

  def insert(position, beats)
    @list.insert(position, beats)
  end

  def includes?(beats)
    @list.includes?(beats)
  end

  def pop(quantity)
    @list.pop(quantity)
  end

  def count
    @list.count
  end

  def find(number, quantity)
    @list.find(number, quantity)
  end
end
