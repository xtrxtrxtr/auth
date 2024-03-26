# frozen_string_literal: true

# Create table for Site model
class CreateSites < ActiveRecord::Migration[7.1]
  def change
    create_table :sites, comment: 'Sites' do |t|
      t.string :host, null: false, index: { unique: true }, comment: 'Hostname'
      t.string :token, null: false, index: true, comment: 'Authentication token'
      t.uuid :uuid, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
