# frozen_string_literal: true

# Site
#
# Attributes:
#   created_at [DateTime]
#   host [String], required
#   token [String], required
#   updated_at [DateTime]
#   uuid [UUID], required
class Site < ApplicationRecord
  include HasUuid

  has_secure_token

  validates :host, presence: true, uniqueness: true
end
