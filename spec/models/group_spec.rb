# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Attribute definition' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end

  describe 'Association' do
    describe 'has_many :members' do
      subject { group.members }

      let(:group) { create(:group) }
      let(:user) { create(:user) }

      before { group.members << user }
      it { is_expected.to include user }
    end
  end

  describe 'validates' do
    subject { group }
    let(:group) { create(:group) }

    it { is_expected.to be_valid }

    describe 'name' do
      it 'expect to require a name' do
        group.name = ''
        is_expected.not_to be_valid
      end
    end
  end
end
