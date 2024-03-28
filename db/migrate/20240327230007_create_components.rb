# frozen_string_literal: true

# Create table for Component model
class CreateComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :components, comment: 'Components' do |t|
      t.uuid :uuid, null: false, index: { unique: true }
      t.string :slug, null: false
      t.integer :priority, null: false, default: 1, limit: 2, comment: 'Priority for order'
      t.timestamps
    end

    add_index :components, 'lower(slug)', unique: true
  end
end
