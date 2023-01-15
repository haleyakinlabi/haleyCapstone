class AddSearchIndexes < ActiveRecord::Migration[7.0]
  def change
    enable_extension :pg_trgm
    add_index :users, :username, using: :gin, opclass: :gin_trgm_ops, name: "index_users_on_username_trgm"
    add_index :users, :species, using: :gin, opclass: :gin_trgm_ops, name: "index_users_on_species_trgm"
    add_index :users, :breed, using: :gin, opclass: :gin_trgm_ops, name: "index_users_on_breed_trgm"
  end
end
