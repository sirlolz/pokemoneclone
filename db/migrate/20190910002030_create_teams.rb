class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :user_id
      t.integer :pokemon_id
      t.timestamps
    end
  end
end
