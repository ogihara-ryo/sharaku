# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  author_id   :integer
#  category_id :integer
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :topic do
    association :author, factory: :user
    association :category, factory: :topic_category
    sequence(:title) { |i| "topic_#{i}" }
    sequence(:description) { |i| "description_#{i}" }
  end
end
