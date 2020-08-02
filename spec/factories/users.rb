FactoryBot.define do

  factory :user do
    usernoid              {"@kakao111"}
    nickname              {"kakao11"}
    email                 {"kkk11@gmail.com"}
    password              {"00000000ss"}
    password_confirmation {"00000000ss"}
    sequence(:email) {Faker::Internet.email}
    sequence(:usernoid) {Faker::Internet.usernoid}
  end

end