class AddPrimaryChallengeToUsersAndActivetoChallenges < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :primary_challenge, foreign_key: { to_table: :challenges }, index: true
    add_column :challenges, :active, :boolean
  end
end
