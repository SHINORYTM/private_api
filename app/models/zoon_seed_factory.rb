class ZoonSeedFactory < SeedFactory
  include ActiveModel::Model

  def create
    ZoonSeed.new(seed)
  end
end
