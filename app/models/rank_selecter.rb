class RankSelecter
  include ActiveModel::Model

  Rank = ["apprentice", "soldier", "major", "commander", "colonel", "major_general", "middle_commander", "general"]

  def self.select(chara)
    rank = nil
    i = 0
    Rank.count.times do
      rank = Rank[i + 1] and break if Rank[i] == chara.rank
      i += 1
    end
    rank
  end
end
