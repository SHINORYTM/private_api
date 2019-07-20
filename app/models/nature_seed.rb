class NatureSeed < Seed
  include ActiveModel::Model

  def initialize(name)
    super(name)
    @type = "自然系"
  end

  def ability
    p "#{name}:実態がなくなるため、攻撃を受け付けない"
  end
end
