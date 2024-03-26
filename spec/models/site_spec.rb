# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Site do
  let!(:existing_site) { create(:site) }

  it_behaves_like 'has_valid_factory'

  describe 'validation' do
    it 'passes with unique host' do
      expect(build(:site)).to be_valid
    end

    it 'fails with non-unique host', :aggregate_failures do
      entity = build(:site, host: existing_site.host)
      expect(entity).not_to be_valid
      expect(entity.errors.messages).to have_key(:host)
    end

    it 'fails with empty host', :aggregate_failures do
      entity = build(:site, host: nil)
      expect(entity).not_to be_valid
      expect(entity.errors.messages).to have_key(:host)
    end
  end
end
