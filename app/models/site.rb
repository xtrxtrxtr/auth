# frozen_string_literal: true

# Site
#
# Attributes:
#   active [Boolean], required
#   created_at [DateTime]
#   host [String], required
#   token [String], required
#   updated_at [DateTime]
#   uuid [UUID], required
class Site < ApplicationRecord
  include HasUuid

  has_secure_token
  has_many :users, dependent: :nullify

  validates :active, inclusion: { in: [true, false] }
  validates :host,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 100 }
end
