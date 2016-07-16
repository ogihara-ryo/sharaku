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

require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'Attribute definition' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:author_id) }
    it { is_expected.to respond_to(:category_id) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end

  describe 'Association' do
    describe 'belongs_to :category' do
      subject { topic.category }

      let(:category) { create(:topic_category) }
      let(:topic) { create(:topic, category: category) }

      it { is_expected.to eq category }
    end
  end
end
