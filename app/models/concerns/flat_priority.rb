# frozen_string_literal: true

# Model has flat priority field
#
# Adds sorting items by priority
# @author Maxim Khan-Magomedov <maxim.km@gmail.com>
module FlatPriority
  extend ActiveSupport::Concern

  included do
    after_initialize :set_next_priority

    validates :priority,
              presence: true,
              numericality: { greater_than: 0, less_than: 32_768 }

    scope :ordered_by_priority, -> { order(:priority) }
  end

  # @param [Integer] delta
  def change_priority(delta)
    swap_priority_with_adjacent(priority + delta)

    self.class.ordered_by_priority.to_h { |e| [e.id, e.priority] }
  end

  protected

  # @param [Integer] new_priority
  def swap_priority_with_adjacent(new_priority)
    adjacent = self.class.find_by(priority: new_priority)
    adjacent.update!(priority:) if adjacent.is_a?(self.class) && (adjacent.id != id)
    update!(priority: new_priority)
  end

  def set_next_priority
    return unless id.nil? && priority == 1

    self.priority = [self.class.maximum(:priority).to_i + 1, 32_767].min
  end
end
