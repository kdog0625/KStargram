FactoryBot.define do
  factory :tweet do
    title {"オススメのファッション!"}
    image {"hoge.png"}
    temp {"15℃"}
    typestyle {"普通"}
    season {"10月"} 
    sex {"メンズ"} 
    tall {"156cm"} 
    text {"オススメだよ!"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end