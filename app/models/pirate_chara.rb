class PirateChara < Character
  include ActiveModel::Model

  attr_accessor :prize_money, :observers, :evil_deed

  def initialize(name, belongs)
    super(name, belongs)
    @prize_money = 0
    @evil_deed = 0
    @observers = [Navy.new]
  end

  def add_observer(observer)
    observers << observer
  end

  def do_evil
    self.evil_deed += 1
    add_observer(Government.new) if self.evil_deed == 15
    notification
  end
end
