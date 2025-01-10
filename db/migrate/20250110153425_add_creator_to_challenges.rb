class AddCreatorToChallenges < ActiveRecord::Migration[8.0]
  def change
    add_reference :challenges, :creator, foreign_key: { to_table: :users }
  end
end
