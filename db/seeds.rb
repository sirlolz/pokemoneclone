# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pokemon.destroy_all
User.destroy_all
Team.destroy_all
Npc.destroy_all
Pack.destroy_all

raw_response = RestClient.get('https://pokeapi.co/api/v2/pokemon?limit=151')
data = JSON.parse(raw_response)
pokemon_info = {}

data['results'].each do |p|
    pokemon_info[:name] = p['name']
    pokemon_stats = JSON.parse(RestClient.get(p['url']))
    pokemon_info[:hp] = pokemon_stats['stats'][5]['base_stat']
    pokemon_info[:att] = pokemon_stats['stats'][4]['base_stat']/2
    pokemon_info[:img]= pokemon_stats['sprites']['front_default']
    pokemon = Pokemon.new(pokemon_info)
    pokemon.save
end

counter = 1

10.times do
    npc = Npc.create(name: "npc#{counter}")
    Pack.create(npc_id: npc.id, pokemon_id: counter, hp: Pokemon.find(counter).hp)
    counter +=1
end