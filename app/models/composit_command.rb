class CompositCommand < Command
  include ActiveModel::Model

  attr_accessor :commands, :setting

  def initialize
    @commands = []
    @setting = false
  end

  def add_command(cmd)
    setting = true if setting == false
    commands << cmd
  end

  def execute
    commands.each(&:execute)
  end
end
