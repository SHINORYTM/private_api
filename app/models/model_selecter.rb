class ModelSelecter
  include ActiveModel::Model

  SeedName = [
    { cat: "ネコネコの実" },
    { dog: "イヌイヌの実" },
    { elephant: "ゾウゾウの実" },
    { bird: "トリトリの実" },
    { doragon: "リュウリュウの実" },
    { cow: "ウシウシの実" },
    { human: "ヒトヒトの実" },
  ]

  ModelList = {
    cat: ["レオパルド"],
    dog: ["ジャッカル", "ダックスフンド", "ウルフ", "キュウビ", "ダルメシアン"],
    bird: ["ファルコン", "フェニックス", "フクロウ"],
    doragon: ["プテラノドン", "アロサウルス", "スピノサウルス", "ブラキオサウルス"],
    cow: ["バイソン", "ジラフ"],
    human: ["ヒト", "大仏"],
    elephant: ["マンモス"]
  }

  def self.select(name)
    model = SeedName.select { |model| model.values.include?(name) }.first.keys.first
    ModelList[model].sample
  end
end
