# frozen_string_literal: true

# Component
#
# Attributes:
#   created_at [DateTime]
#   priority [Integer], required
#   slug [String], required
#   updated_at [DateTime]
#   uuid [UUID], required
class Component < ApplicationRecord
  include HasUuid
  include FlatPriority

  validates :slug,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 64 },
            format: /\A[a-z][_a-z]+[a-z]\z/
end
