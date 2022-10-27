FactoryBot.define do
  factory :user do
    trait :attributes do
      email { 'user@user.com' }
      password { 'teste123' }
      user_name { 'user' }
    end
  end
end
