# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.bigint :user_id, null: false
      t.text :body, null: false
      t.integer :like_count, null: false, default: 0

      t.timestamps

      t.index :user_id
    end
  end
end
