# frozen_string_literal: true

RSpec.shared_examples_for 'has_uuid' do
  shared_examples 'assigning new uuid' do
    it 'generates uuid' do
      expect(entity.uuid).to be_present
    end
  end

  it { is_expected.to validate_presence_of(:uuid) }
  it { is_expected.to validate_uniqueness_of(:uuid).ignoring_case_sensitivity }

  describe '#new' do
    let(:entity) { described_class.new(uuid:) }

    context 'when explicit uuid is given' do
      let(:uuid) { SecureRandom.uuid }

      it 'does not change uuid' do
        expect(entity.uuid).to eq(uuid)
      end
    end

    context 'when uuid is not given' do
      let(:entity) { described_class.new }

      it_behaves_like 'assigning new uuid'
    end

    context 'when uuid is nil' do
      let(:uuid) { nil }

      it_behaves_like 'assigning new uuid'
    end
  end
end
