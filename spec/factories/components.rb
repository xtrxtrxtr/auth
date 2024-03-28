# frozen_string_literal: true

FactoryBot.define do
  factory :component do
    slug { "a#{[*'a'..'z', '_'].sample(16).join}z" }

    initialize_with { new(**attributes) }
  end
end
