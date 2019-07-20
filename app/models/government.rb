class Government
  include ActiveModel::Model

  def update(chara)
    belongs = chara.belongs
    instance_eval("update_for_#{belongs}(chara)")
  end

  private

  def update_for_pirate(chara)
    p "#{chara.name}が悪行を行なった"
  end

  def update_for_revolutionary_army(chara)
    p "#{chara.name}が悪行を行なった"
  end
end
