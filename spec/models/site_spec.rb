# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Site do
  before do
    create(:site)
  end

  it_behaves_like 'has_valid_factory'
  it_behaves_like 'has_uuid'

  it { is_expected.to have_secure_token }
  # it { is_expected.to have_many(:users) }
  it { is_expected.to validate_presence_of(:host) }
  it { is_expected.to validate_length_of(:host).is_at_least(10).is_at_most(100) }
  it { is_expected.to validate_uniqueness_of(:host).ignoring_case_sensitivity }
end
