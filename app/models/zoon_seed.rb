class ZoonSeed < Seed
  include ActiveModel::Model

  attr_reader :model

  def initialize(name)
    super(name)
    @type = "動物系"
    @model = model_select
  end

  def ability
    p "#{name}:変身して自身の肉体を強化する"
  end

  def model_select
    ModelSelecter.select(name)
  end
end
