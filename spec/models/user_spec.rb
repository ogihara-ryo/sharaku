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
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
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

      it 'expect to accept valid email addresses' do
        %w(user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn).each do |address|
          user.email = address
          is_expected.to be_valid
        end
      end

      it 'expect to reject invalid email addresses' do
        %w(user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com foo@bar..com).each do |address|
          user.email = address
          is_expected.not_to be_valid
        end
      end

      it 'expect to reject duplicate email addresses' do
        create(:user, email: 'Uniqueness@Example.com')
        user.email = 'uniqueness@example.com'
        is_expected.not_to be_valid
      end
    end

    describe 'password' do
      it 'Expect to require a password' do
        user.password = user.password_confirmation = ''
        is_expected.not_to be_valid
      end

      it 'Expect to require a matching password confirmation' do
        user.password = 'password'
        user.password_confirmation = 'PASSWORD'
        is_expected.not_to be_valid
      end

      it 'expect to reject short password' do
        user.password = user.password_confirmation = 'a' * 7
        is_expected.not_to be_valid
      end
    end
  end

  describe 'callbacks' do
    it 'Convert the e-mail address to lower case before saving' do
      user = create(:user, email: 'User@Example.com')
      expect(user.email).to eq 'user@example.com'
    end
  end
end
