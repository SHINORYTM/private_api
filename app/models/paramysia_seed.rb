class ParamysiaSeed < Seed
  include ActiveModel::Model

  def initialize(name)
    super(name)
    @type = "超人系"
  end

  def ability
    p "#{name}:#{name.split("の").first}人間になる"
  end
end
