FactoryBot.define do
  factory :shift do
    current_day { "2022-05-24 18:39:36" }
    clock_in { DateTime.now.strftime("%d/%m/%y  %H:%m") }
    clock_out { DateTime.now.strftime("%d/%m/%y  %H:%m") }
  end
end
