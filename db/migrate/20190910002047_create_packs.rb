class CreatePacks < ActiveRecord::Migration[5.2]
  def change
    create_table :packs do |t|
      t.integer :pokemon_id
      t.integer :npc_id
      t.integer :hp
      t.timestamps
    end
  end
end
