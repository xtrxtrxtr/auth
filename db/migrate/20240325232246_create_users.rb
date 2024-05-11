# frozen_string_literal: true

# Create table for User model
class CreateUsers < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    create_table :users, comment: 'Users' do |t|
      t.uuid :uuid, null: false, index: { unique: true }
      t.references :site, foreign_key: { on_update: :cascade, on_delete: :nullify }, comment: 'Origin'
      t.string :slug, collation: 'C', null: false, comment: 'Slug (case-insensitive)'
      t.bigint :inviter_id, comment: 'Who invited this user'
      t.boolean :super_user, null: false, default: false, comment: 'User has unlimited privileges'
      t.boolean :active, null: false, default: true, comment: 'User is allowed to log in'
      t.boolean :bot, null: false, default: false, comment: 'User can be handled as bot'
      t.boolean :email_confirmed, null: false, default: false, comment: 'Email is confirmed'
      t.string :email, collation: 'C', null: false, comment: 'Primary email'
      t.inet :ip_address, comment: 'IP address at the moment of registration'
      t.string :password_digest, null: false, comment: 'Encrypted password'
      t.string :notice, comment: 'Administrative notice'
      t.string :referral_code, index: { unique: true }, comment: 'Referral code'
      t.jsonb :profile, null: false, default: {}, index: { using: :gin }, comment: 'Profile'
      t.datetime :deleted_at, comment: 'Timestamp when user was deleted'
      t.timestamps
    end

    add_foreign_key :users, :users, column: :inviter_id, on_update: :cascade, on_delete: :nullify
    add_index :users, 'lower(slug)', unique: true
    add_index :users, 'lower(email) varchar_pattern_ops', unique: true
  end
end
