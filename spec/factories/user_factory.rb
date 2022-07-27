FactoryBot.define do
  factory :user do
    trait :valid_attrib do
      email { 'user@user.com' }
      password { 'teste123' }
      user_name { 'user' }
    end

    trait :no_email do
      email { nil }
      password { 'teste123' }
      user_name { 'user' }
    end

    trait :no_password do
      email { 'user@user.com' }
      password { nil }
      user_name { 'user' }
    end

    trait :no_user_name do
      email { 'user@user.com' }
      password { 'teste123' }
      user_name { nil }
    end
  end
end
