class User < ApplicationRecord
    has_many :teams
    has_many :pokemons, through: :teams
    has_many :battles
    has_many :npcs, through: :battle
<<<<<<< HEAD
=======
    
    validates :name, length: {minimum: 3}, presence: true, uniqueness: true
>>>>>>> master
end