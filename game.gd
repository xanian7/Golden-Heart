extends Node2D
var screen_size # Size of the game window.

var game_length = 10.0
var num_quarters = 4
var timer = game_length

var home_team_name = 'Home'
var away_team_name = 'Away'
var home_team_points = 0
var away_team_points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var quarter_length = game_length / num_quarters
	
	if round(timer) > 0:
		#decrease remaining time (only play when time > 0)
		timer -= delta
	else:
		pass #end game

func add_to_points(team, points):
	if team == home_team_name:
		home_team_points += points
		print(home_team_points)

func set_team_names(home_team, away_team):
	home_team_name = home_team
	away_team_name = away_team
	
func get_home_team():
	return home_team_name

func get_away_team():
	return away_team_name	

func get_team_points(team):
	if team == home_team_name:
		return home_team_points
	elif team == away_team_name:
		return away_team_points
		
func get_clock():
	return timer
	
func game_over():
	pass
