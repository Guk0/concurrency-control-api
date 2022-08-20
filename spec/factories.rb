FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@factory.com" }
  end
end