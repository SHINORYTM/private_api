class Status

  include ActiveModel::Model

  attr_accessor :hp, :attack, :defence, :awakening

  delegate :hp, to: :hp, prefix: :common
  delegate :attack, to: :attack, prefix: :common
  delegate :critical, to: :attack
  delegate :defence, to: :defence, prefix: :common
  delegate :iron_wall, to: :defence

  Result = ["success", "fail"]

  def initialize
    @hp = StatusHp.new
    @attack = StatusAttack.new
    @defence = StatusDefence.new
    @awakening = nil
  end

  def strengthen
    hp.strengthen if Result.sample == "success"
    attack.strengthen if Result.sample == "success"
    defence.strengthen if Result.sample == "success"
  end
end
