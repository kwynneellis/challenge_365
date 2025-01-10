class AddActiveToChallenges < ActiveRecord::Migration[8.0]
  def change
    add_column :challenges, :active, :boolean
  end
end
