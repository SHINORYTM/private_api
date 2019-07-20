class StatusAttack

  include ActiveModel::Model

  attr_accessor :attack, :critial

  RandamNumber = [1, 2, 3, 4, 5]

  def initialize
    @attack = 5
    @critical = attack * 1.5
  end

  def strengthen
    self.attack += RandamNumber.sample
  end
end
