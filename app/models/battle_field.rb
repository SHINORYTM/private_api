class BattleField
  include ActiveModel::Model

  attr_accessor :chara1, :chara2

  def initialize(chara1, chara2)
    @chara1 = chara1
    @chara2 = chara2
  end

  def start_battle
    while chara1.status.common_hp <= 0 || chara2.status.common_hp <= 0

    end
  end
end
