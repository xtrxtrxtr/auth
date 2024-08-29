# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationHandler do
  let(:handler) { described_class.new(create(:site)) }

  describe '#register' do
    context 'when given parameters are valid' do
      let(:parameters) { { slug: 'Maxim', password: 'secret', password_confirmation: 'secret' } }

      it 'creates a new user' do
        expect { handler.register(parameters) }.to change(User, :count).by(1)
      end

      it 'returns true' do
        expect(handler.register(parameters)).to be(true)
      end

      it 'has no errors' do
        handler.register(parameters)
        expect(handler.errors).to eq({})
      end

      it 'assigns site to created user' do
        handler.register(parameters)
        expect(User.last.site).to eq(handler.site)
      end

      it 'ignores non-permitted parameters' do
        handler.register(parameters.merge(active: false))
        expect(User.last).to be_active
      end
    end

    context 'when given parameters are invalid' do
      let(:parameters) { { slug: 'nope!', password: 'a', password_confirmation: 'b' } }

      it 'does not create user' do
        expect { handler.register(parameters) }.not_to change(User, :count)
      end

      it 'returns false' do
        expect(handler.register(parameters)).to be(false)
      end

      it 'has errors from model', :aggregate_failures do
        handler.register(parameters)
        expect(handler.errors).to have_key(:slug)
        expect(handler.errors).to have_key(:password_confirmation)
      end
    end
  end
end
