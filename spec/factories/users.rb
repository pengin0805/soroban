FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name}
    end
    nickname         {Faker::Name.initials(number: 4)}
    email            {Faker::Internet.free_email}
    password         { Faker::Lorem.characters(number: 6)}
    password_confirmation { password }
    last_name        { person.last.kanji }
    first_name       { person.first.kanji }
    last_name_kana   { person.last.katakana }
    first_name_kana  { person.first.katakana }
    subscription_id  {"sub_477fc336f72a8ff305cc380bd963"}
    premium          {"false"}
  end
end