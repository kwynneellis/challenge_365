class CreateChallenges < ActiveRecord::Migration[8.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :challenge_type
      t.date :start_date
      t.date :end_date
      t.boolean :public, default: false
      t.boolean :archive, default: false
      t.integer :starting_volume
      t.integer :minimum_volume
      t.string :rep_unit

      t.timestamps
    end
  end
end
