class NatureSeedFactory < SeedFactory
  include ActiveModel::Model

  def create
    NatureSeed.new(seed)
  end
end
