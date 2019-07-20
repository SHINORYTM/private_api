class Seed
  include ActiveModel::Model

  attr_accessor :name, :type

  def initialize(name)
    @name = name 
  end

  def ability
    raise "you must implement #{__method__}"
  end
end
