class Battle < ApplicationRecord
    belongs_to :user
    belongs_to :npc

    
    def fight
        user_damage = self.user.teams.first.pokemon.att
        npc_damage = self.npc.packs.first.pokemon.att
        user_hp = self.user.teams.first
        npc_hp = self.npc.packs.first

        user_hp.update(hp: user_hp.hp -= npc_damage)
        npc_hp.update(hp: npc_hp.hp -= user_damage)
    end
    def alive
        if user.teams.first.hp > 0 && npc.packs.first.hp > 0
            true
        else
            false
        end
    end
    def win
        if user.teams.first.hp > 0 && npc.packs.first.hp < 0
            true
        else
            false
        end
    end
    def lose
        if user.teams.first.hp < 0 && npc.packs.first.hp > 0
            true
        else
            false
        end
    end
end
