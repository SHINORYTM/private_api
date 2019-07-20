class Navy
  include ActiveModel::Model

  def update(chara)
    belongs = chara.belongs
    instance_eval("update_for_#{belongs}(chara)")
  end

  private

  def update_for_pirate(chara)
    p "#{chara.name}が悪行を行なった"
    go_up_prize_money(chara) if (chara.evil_deed % 5) == 0 && (chara.evil_deed != 0)
  end

  def update_for_revolutionary_army(chara)
    p "#{chara.name}が悪行を行なった"
    go_up_prize_money(chara) if (chara.evil_deed % 5) == 0 && (chara.evil_deed != 0)
  end

  def update_for_navy(chara)
    p "#{chara.name}が功績を残した"
    rises_rank(chara) if (chara.evaluation % 5) == 0 && (chara.evaluation != 0)
  end

  def go_up_prize_money(chara)
    chara.prize_money += 100000
    p "#{chara.name}の懸賞金が上がった"
  end
  
  def rises_rank(chara)
    return if chara.rank == "general"
    chara.rank = RankSelecter.select(chara)
    p "#{chara.name}の階級が#{chara.rank}になった"
  end
end
