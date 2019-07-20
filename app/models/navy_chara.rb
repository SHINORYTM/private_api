class NavyChara < Character
  include ActiveModel::Model

  attr_accessor :rank, :observers, :evaluation

  def initialize(name, belongs)
    super(name, belongs)
    @rank = "apprentice"
    @observers = [Navy.new]
    @evaluation = 0
  end

  def add_observer(observer)
    observers << observer
  end

  def leave_achievements
    self.evaluation += 1
    notification
  end
end
