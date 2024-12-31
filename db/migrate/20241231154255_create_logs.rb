class CreateLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.date :date_of_set
      t.integer :reps_in_set

      t.timestamps
    end
  end
end
