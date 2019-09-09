class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string  :name
      t.integer :hp
      t.integer :att
      t.timestamps
    end
  end
end
