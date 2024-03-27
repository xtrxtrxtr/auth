# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  before do
    create(:user)
  end

  it_behaves_like 'has_uuid'
  it_behaves_like 'has_required_boolean_attribute', :active
  it_behaves_like 'has_required_boolean_attribute', :bot
  it_behaves_like 'has_required_hash_attribute', :data
  it_behaves_like 'has_required_boolean_attribute', :email_confirmed
  it_behaves_like 'has_required_hash_attribute', :profile
  it_behaves_like 'has_required_hash_attribute', :settings
  it_behaves_like 'has_required_boolean_attribute', :super_user

  it { is_expected.to belong_to(:site).optional }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_length_of(:email).is_at_most(200) }
  it { is_expected.to allow_value('user@example.org').for(:email) }
  it { is_expected.not_to allow_value('not-a-email').for(:email) }
  it { is_expected.to belong_to(:inviter).optional }
  it { is_expected.to have_many(:invitees) }
  it { is_expected.to validate_uniqueness_of(:referral_code).allow_nil }
  it { is_expected.to validate_length_of(:referral_code).is_at_least(1).is_at_most(16) }
  it { is_expected.to validate_uniqueness_of(:slug).case_insensitive }
  it { is_expected.to validate_length_of(:slug).is_at_least(1).is_at_most(16) }
  it { is_expected.to allow_value('Maxim').for(:slug) }
  it { is_expected.not_to allow_value('Who?!').for(:slug) }

  describe '#new' do
    context 'when referral_code is given' do
      let(:referral_code) { 'referral' }

      it 'does not assign new referral code' do
        expect(described_class.new(referral_code:).referral_code).to eq(referral_code)
      end
    end

    context 'when referral_code is not given' do
      it 'assigns new referral code' do
        expect(described_class.new.referral_code).to be_present
      end
    end
  end
end
