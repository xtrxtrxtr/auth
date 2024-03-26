# frozen_string_literal: true

# Adds UUID field and constraints to model
module HasUuid
  extend ActiveSupport::Concern

  included do
    after_initialize { self.uuid = SecureRandom.uuid if uuid.nil? }
    validates :uuid, presence: true, uniqueness: { case_sensitive: false }
  end
end
