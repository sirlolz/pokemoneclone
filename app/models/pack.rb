class Pack < ApplicationRecord
    belongs_to :pokemon
    belongs_to :npc
    validates :pokemon_id, presence: true
end
