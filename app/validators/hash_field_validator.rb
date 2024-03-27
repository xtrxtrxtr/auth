# frozen_string_literal: true

# Validates that field is hash
#
# Used mostly for JSON fields in models
class HashFieldValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.is_a? Hash

    record.errors.add attribute, (options[:message] || 'must be a hash')
  end
end
