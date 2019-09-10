class Battle < ApplicationRecord
    belongs_to :user
    belongs_to :npc
end
