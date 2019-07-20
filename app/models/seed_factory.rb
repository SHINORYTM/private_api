class SeedFactory
  include ActiveModel::Model

  attr_reader :seed

  SeedName = [
    {
      ParamysiaSeed: [
        "ゴムゴムの実",
        "バラバラの実",
        "グラグラの実",
        "オペオペの実",
        "ハナハナの実",
        "イトイトの実",
        "ソルソルの実",
        "アワアワの実",
        "ヨミヨミの実",
        "カゲカゲの実",
        "メロメロの実",
        "スケスケの実",
        "ヤミヤミの実"
      ]
    },
    {
      NatureSeed: [
        "ゴロゴロの実",
        "スナスナの実",
        "ヒエヒエの実",
        "ピカピカの実",
        "メラメラの実",
        "マグマグの実",
        "モチモチの実",
        "ヌマヌマの実"
      ]
    },
    {
      ZoonSeed: [
        "ネコネコの実",
        "ゾウゾウの実",
        "イヌイヌの実",
        "トリトリの実",
        "リュウリュウの実",
        "ウシウシの実",
        "ヒトヒトの実"
      ]
    }
  ]

  def initialize(seed)
    @seed = seed
  end

  def create
    raise "you must implement #{__method__}"
  end

  def self.select_factory(seed)
    seed_type = SeedName.select { |s| s.values.first.include?(seed) }.first.keys.first.to_s
    raise "#{seed} is not exist" unless seed_type.present?
    "#{seed_type}Factory".constantize.new(seed)
  end
end
