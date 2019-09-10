class Npc < ApplicationRecord
    has_many :packs
    has_many :pokemons, through: :packs
end
