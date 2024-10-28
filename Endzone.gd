extends Area2D
var screen_size # Size of the game window.
var team = 'team1'
signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	var main_node = get_tree().root.get_child(0) 
	team = main_node.get_home_team()
	print(team)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if (area.has_node('Football')):
		var main_node = get_tree().root.get_child(0) 
		main_node.add_to_points(team, 6)
