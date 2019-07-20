class ParamysiaSeedFactory < SeedFactory
  include ActiveModel::Model

  def create
    ParamysiaSeed.new(seed)
  end
end
