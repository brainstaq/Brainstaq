module Brainstorm::Timed
  def timer
    @timer ||= Brainstorm::Timer.new(self)
  end

  def timer_expired
    self.state = :vote if state.conception?
  end
end
