class StatusHp

  include ActiveModel::Model

  attr_accessor :hp

  RandamNumber = [10, 15, 20, 25, 30]

  def initialize
    @hp = 50
  end

  def strengthen
    self.hp += RandamNumber.sample
  end
end
