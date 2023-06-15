FactoryBot.define do
  factory :admin do
    email                 { "admin@admin" }
    password              { "000000" }
    password_confirmation { password }
  end
end