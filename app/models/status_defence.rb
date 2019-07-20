class StatusDefence

  include ActiveModel::Model

  attr_accessor :defence, :iron_wall

  RandamNumber = [1, 2, 3, 4, 5]

  def initialize
    @defence = 5
    @iron_wall = 5
  end

  def strengthen
    self.defence += RandamNumber.sample
  end
end
