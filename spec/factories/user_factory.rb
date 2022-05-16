FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@sample.com" }
    password { 'teste123' }
  end
end
