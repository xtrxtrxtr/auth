# frozen_string_literal: true

# Create table for Site model
class CreateSites < ActiveRecord::Migration[7.1]
  def change
    create_table :sites, comment: 'Sites' do |t|
      t.string :host, null: false, comment: 'Hostname'
      t.string :token, null: false, index: { unique: true }, comment: 'Authentication token'
      t.uuid :uuid, null: false, index: { unique: true }
      t.boolean :active, null: false, default: true
      t.timestamps
    end

    add_index :sites, 'lower(host)', unique: true
  end
end
