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
        user.teams.first.hp > 0 && npc.packs.first.hp > 0
    end
    def win
        user.teams.first.hp > 0 && npc.packs.first.hp < 0
    end
    def lose
        user.teams.first.hp < 0 && npc.packs.first.hp > 0
    end
    def reset_stats
        user.teams.each do |team|
            team.update hp: team.pokemon.hp
        end
        npc.packs.each do |team|
            team.update hp: team.pokemon.hp
        end
    end
end
