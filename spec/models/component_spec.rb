# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Component do
  before do
    create(:component)
  end

  it_behaves_like 'has_uuid'
  it_behaves_like 'has_flat_priority'

  it { is_expected.to validate_uniqueness_of(:slug).ignoring_case_sensitivity }
  it { is_expected.to validate_length_of(:slug).is_at_least(3).is_at_most(64) }
  it { is_expected.to allow_values('users', 'new_component').for(:slug) }
  it { is_expected.not_to allow_values('invalid-name', 'NoCaps').for(:slug) }
end
