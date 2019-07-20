class Character
  include ActiveModel::Model

  attr_reader :name, :belongs, :seed, :battle_command
  attr_accessor :type, :status, :willpower, :watch

  delegate :name, to: :seed, prefix: :seed, allow_nil: true
  delegate :type, to: :seed, prefix: :seed, allow_nil: true
  delegate :model, to: :seed, prefix: :seed, allow_nil: true
  delegate :hp, to: :status
  delegate :attack, to: :status
  delegate :defence, to: :status
  delegate :awakening, to: :status

  Belongs = ["pirate", "navy", "government", "revolutionary_army"]

  def initialize(name, belongs)
    @name = name
    @belongs = belongs
    @type = "common"
    @status = Status.new
    @willpower = 10
    @watch = Time.zone.now
    @battle_command = CompositCommand.new
  end

  def self.create(name, belongs)
    raise "#{belongs} is not exist" unless Belongs.include?(belongs)
    "#{belongs.camelize}Chara".constantize.new(name, belongs)
  end

  def eat_seed(seed)
    factory = SeedFactory.select_factory(seed)
    @seed = factory.create
    @type = "ability"
    p "#{seed_name}の能力を手に入れた"
  end

  def set_battle_command
    battle_command.set
  end

  def battle(target)
    return p "対戦相手が見つかりません" unless target.try(:name)
    return p "please setting command" unless battle_command.setting
    battle_field = BattleField.new(self, target)
    battle_field.start_battle
  end

  def training(i=1)
    return p "気力が足りません" unless can_consume_willpower?(i)
    self.willpower -= i
    i.times do
      status.strengthen
    end
    p "#{name}の修行を行なった"
  end

  def activate_ability
    seed.ability if seed
  end

  private

  def can_consume_willpower?(i)
    i < self.willpower
  end

  def notification
    observers.each { |observer| observer.update(self) }
  end
end
