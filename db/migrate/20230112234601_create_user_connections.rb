# frozen_string_literal: true

class CreateUserConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :user_connections do |t|
      t.bigint :leader_id, null: false
      t.bigint :follower_id, null: false

      t.timestamps

      t.index [:leader_id, :follower_id], unique: true
    end
  end
end
