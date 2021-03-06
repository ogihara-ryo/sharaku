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

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Attribute definition' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:password_digest) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:password_confirmation) }
    it { is_expected.to respond_to(:first_name) }
    it { is_expected.to respond_to(:last_name) }
    it { is_expected.to respond_to(:admin) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end

  describe 'Association' do
    describe 'has_many :groups' do
      subject { user.groups }

      let(:group) { create(:group) }
      let(:user) { create(:user) }

      before { user.groups << group }
      it { is_expected.to include group }
    end

    describe 'has_many :topics' do
      subject { user.topics }

      let(:topic) { create(:topic) }
      let(:user) { create(:user) }

      before { user.topics << topic }
      it { is_expected.to include topic }
    end
  end

  describe 'validates' do
    subject { user }
    let(:user) { create(:user) }

    it { is_expected.to be_valid }

    describe 'email' do
      it 'expect to require an email address' do
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

    describe 'first_name' do
      it 'Expect to require a first name' do
        user.first_name = ''
        is_expected.not_to be_valid
      end
    end

    describe 'last_name' do
      it 'Expect to require a last name' do
        user.last_name = ''
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
