class AddUsernameToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table(:users) do |t|
      t.string :username, null: false
    end
  end
end
