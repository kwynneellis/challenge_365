class AddCreatedByToChallenges < ActiveRecord::Migration[8.0]
  def change
    add_reference :challenges, :creator, foreign_key: { to_table: :users }
    add_column :users, :username, :string
    add_column :users, :visibility, :boolean, default: false
  end
end
