class Brainstorm::DynamicVoteCounter

  attr_reader :brainstorm

  def initialize(brainstorm)
    @brainstorm = brainstorm
  end
  
  def votes
    case
      when brainstorm.concepts.size > 20
        8
      when brainstorm.concepts.size >= 10
        6
      when brainstorm.concepts.size < 9
        3
    end
  end
end
