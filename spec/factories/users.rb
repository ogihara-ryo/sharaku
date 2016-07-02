FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user_#{i}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
