extends Control

var game_name: String
var genre: String
var quality: String
@export var name_label: Label
@export var quality_texture: TextureRect

enum qualities {
	AMAZING,
	GREAT,
	GOOD,
	POOR,
	AWFUL,
}

var game_names = [
	"Shadow Veil", "Echo Drift", "Bladeborn", "Pulse Shift", "Lost Haven", 
	"Neon Dust", "Skybound", "Core Breach", "Aetherfall", "Quantum Ash", 
	"Void Runner", "Soul Forge", "Starbound", "Iron Rift", "Crystal Tide", 
	"Emberfall", "Lunar Echo", "Frostforge", "Pixel Bloom", "Dark Horizon", 
	"Echo Vale", "Night Strider", "Spiritbound", "Pulseforge", "Flameborn", 
	"Neon Abyss", "Silent Tide", "Echoheart", "Lost Ember", "Hollow Reign", 
	"Nova Drift", "Shattered Sky", "Crimson Forge", "Vortex Bound", "Runeveil", 
	"Duskfall", "Firestrike", "Frozen Echo", "Phantom Shift", "Nebula Rise", 
	"Sundered Sun", "Starlit Ash", "Steelborn", "Arcane Rift", "Spectral Path", 
	"Edge of Light", "Celestial Rift", "Cinderfall", "Darklight", "Runewind", 
	"Neon Blaze", "Moonforge", "Frostspire", "Echo Warden", "Aether Tide", 
	"Crimson Echo", "Ironborn", "Shardfall", "Phantom Strike", "Silent Reign", 
	"Skyforge", "Void Reign", "Blazeheart", "Eclipse Bound", "Nightfall", 
	"Ember Strike", "Lunar Veil", "Spectral Echo", "Nebula Forge", "Frozen Flame", 
	"Cinderbound", "Crystal Echo", "Darkforge", "Spirit Drift", "Starlit Rift", 
	"Ironfall", "Sundrift", "Rune Shard", "Shattered Veil", "Celestial Ash", 
	"Phantom Dawn", "Pulse Ember", "Nightbound", "Frostveil", "Neon Reign", 
	"Eclipse Tide", "Lunar Bound", "Starfall", "Ember Veil", "Crimson Tide", 
	"Duskveil", "Arcane Shift", "Voidbound", "Frozen Shard", "Cinder Ash", 
	"Shadowbound", "Sundered Forge", "Crystal Bound", "Nebula Tide", "Silent Ash", 
	"Phantom Echo", "Dark Ember", "Frostborn"
]

var genres = [
	"Action", "Adventure", "Role-Playing Game (RPG)", "Simulation", "Strategy", 
	"Sports", "Puzzle", "Idle", "Survival", "Platformer", 
	"Shooter", "Fighting", "Racing", "Stealth", "Horror", 
	"Open World", "Metroidvania", "Sandbox", "MMORPG", "Roguelike", 
	"Battle Royale", "Rhythm", "Visual Novel", "Tactical", "Tower Defense", 
	"Turn-Based Strategy (TBS)", "Real-Time Strategy (RTS)", "Card Game", "Party", "MOBA", 
	"Interactive Fiction", "Text-Based", "Puzzle Platformer", "Trivia", "Arcade", 
	"Metagame", "Hack and Slash", "Dungeon Crawler", "Point and Click", "Social Simulation", 
	"4X", "Beat 'em Up", "Tycoon", "Grand Strategy", "Bullet Hell", 
	"Vehicular Combat", "Walking Simulator", "Musou", "Pinball", "Educational", 
	"Escape Room", "Fishing", "Life Simulation", "Management", "Match-3", 
	"Fitness", "Rhythm Dance", "Trivia Quiz", "Auto Battler", "Dating Sim"
]



func _ready() -> void:
	var name_choice = game_names.pick_random()
	var quality = qualities.values().pick_random()
	print(quality)
	name_label.text = game_names[name_choice]
	if quality == qualities.AMAZING:
		quality_texture.modulate = Color("YELLOW")
	else:
		quality_texture.modulate = Color("BROWN")
