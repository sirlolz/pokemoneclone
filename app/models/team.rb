class Team < ApplicationRecord
    belongs_to :pokemon
    belongs_to :user

    validates :user_id, presence: true
    validates :pokemon_id, presence: true
end
