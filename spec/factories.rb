FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    count { 1 }
    price { 1 }
  end
end