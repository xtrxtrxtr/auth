# frozen_string_literal: true

RSpec.shared_examples_for 'has_uuid' do
  it { is_expected.to validate_presence_of(:uuid) }
  it { is_expected.to validate_uniqueness_of(:uuid).case_insensitive }

  describe '#new' do
    context 'when uuid is given' do
      let(:uuid) { SecureRandom.uuid }

      it 'does not change uuid' do
        expect(described_class.new(uuid:).uuid).to eq(uuid)
      end
    end

    context 'when uuid is not given' do
      it 'assigns uuid' do
        expect(described_class.new.uuid).to be_present
      end
    end
  end
end
