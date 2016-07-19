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

class Topic < ApplicationRecord
  belongs_to :category, class_name: :TopicCategory, foreign_key: :category_id
  belongs_to :author, class_name: :User, foreign_key: :author_id

  validates :title, presence: true
end
