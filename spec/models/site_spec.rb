# frozen_string_literal: true

RSpec.describe Site do
  let!(:existing_site) { create(:site) }

  it_behaves_like 'has_valid_factory'

  it { is_expected.to have_secure_token }

  describe 'validation' do
    it 'passes with unique host' do
      expect(build(:site)).to be_valid
    end

    it 'fails with non-unique host' do
      expect(build(:site, host: existing_site.host)).not_to be_valid
    end
  end
end
