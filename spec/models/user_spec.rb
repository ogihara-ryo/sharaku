# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Attribute definition' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:password_digest) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:password_confirmation) }
  end

  describe 'validates' do
    subject { user }
    let(:user) { create(:user) }

    it { is_expected.to be_valid }

    describe 'email' do
      it 'expect require an email address' do
        user.email = ''
        is_expected.not_to be_valid
      end
    end
  end
end