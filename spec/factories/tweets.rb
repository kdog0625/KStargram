FactoryBot.define do
  
  factory :tweet do
    title {"女性ファッション"}
    image {File.open("#{Rails.root}/public/images/default.png")}
    temp {"8℃"}
    typestyle {"冷え性"}
    season {"2月"}
    sex {"レディース"}
    tall {"150cm"}
    text {"最新のファッションです"}
    user
  end
end