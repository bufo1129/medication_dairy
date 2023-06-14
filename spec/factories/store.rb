FactoryBot.define do
  factory :store do
    name                  {'test'}
    email                 {'test@example.com'}
    password              {'123456'}
    password_confirmation {password}
    postal_code           {'2310000'}
    prefecture_code       {'14'}
  end
end