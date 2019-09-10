class Pokemon < ApplicationRecord
    has_many :teams
    has_many :users, through: :teams
    has_many :packs
    has_many :npcs, through: :packs
end
