# == Schema Information
#
# Table name: topic_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :topic_category do
    sequence(:name) { |i| "topic_category_#{i}" }
  end
end
