# frozen_string_literal: true

RSpec.shared_examples_for 'has_uuid' do
  let(:model) { described_class.to_s.underscore.to_sym }
  let!(:existing_entity) { create(model) }

  shared_examples 'assigning new uuid' do
    it 'generates uuid' do
      expect(entity.uuid).to be_present
    end
  end

  describe 'validation' do
    it 'passes with unique uuid' do
      expect(build(model)).to be_valid
    end

    it 'fails with non-unique uuid' do
      expect(build(model, uuid: existing_entity.uuid)).not_to be_valid
    end
  end

  describe '#new' do
    context 'when explicit uuid is given' do
      it 'does not change uuid' do
        uuid = SecureRandom.uuid
        entity = described_class.new(uuid:)
        expect(entity.uuid).to eq(uuid)
      end
    end

    context 'when uuid is not given' do
      let(:entity) { described_class.new }

      it_behaves_like 'assigning new uuid'
    end

    context 'when uuid is nil' do
      let(:entity) { described_class.new(uuid: nil) }

      it_behaves_like 'assigning new uuid'
    end
  end
end
