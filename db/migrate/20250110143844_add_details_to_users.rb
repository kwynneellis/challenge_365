class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username, :string
    add_column :users, :visibility, :boolean, default: true
    add_reference :users, :primary_challenge, foreign_key: { to_table: :challenges }, index: true
    add_column :users, :reminder_email_opt_in, :boolean, default: false, null: false
  end
end
