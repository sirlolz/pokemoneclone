class Npc < ApplicationRecord
    has_many :packs
    has_many :pokemons, through: :packs
    has_many :battles
    has_many :users, through: :battle
    validates :name, presence: true
end
