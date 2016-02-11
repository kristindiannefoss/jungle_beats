class Elephant
  attr_reader :mouth_holds
  attr_accessor :whos_your_linked_elephant

  def initialize(value)
    @mouth_holds = value
    @whos_your_linked_elephant = nil
  end
end
