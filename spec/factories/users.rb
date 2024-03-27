# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:slug) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password_digest { BCrypt::Password.create('secret') }
  end
end
