# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  first_name      :string
#  last_name       :string
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
  end
end
