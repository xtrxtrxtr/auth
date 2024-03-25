# frozen_string_literal: true

# Create table for Site model
class CreateSites < ActiveRecord::Migration[7.1]
  def change
    create_table :sites do |t|
      t.string :host, null: false
      t.string :token, null: false
      t.uuid :uuid, null: false
      t.timestamps
    end
  end
end
