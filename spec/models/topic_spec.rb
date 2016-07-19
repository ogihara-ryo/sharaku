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

    describe 'belongs_to :author' do
      subject { topic.author }

      let(:author) { create(:user) }
      let(:topic) { create(:topic, author: author) }

      it { is_expected.to eq author }
    end
  end

  describe 'validates' do
    subject { topic }
    let(:topic) { create(:topic) }

    it { is_expected.to be_valid }

    describe 'title' do
      it 'Expect to require a title' do
        topic.title = ''
        is_expected.not_to be_valid
      end
    end
  end
end
