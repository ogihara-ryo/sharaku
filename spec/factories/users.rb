# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  first_name      :string
#  last_name       :string
#  admin           :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user_#{i}@example.com" }
    password 'password'
    password_confirmation 'password'
    sequence(:first_name) { |i| "first_name_#{i}" }
    sequence(:last_name) { |i| "last_name_#{i}" }

    trait :admin do
      admin true
    end
  end
end
