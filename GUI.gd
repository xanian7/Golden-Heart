extends Control

@onready var home_team_label: Label = $HomeTeam_Label
@onready var clock_label: Label = $Clock_Label

var home_team_name = 'Home'

var home_team_points = 0
var clock_remaining = 0

var main_node

# Called when the node enters the scene tree for the first time.
func _ready():
	main_node = get_tree().root.get_child(0) 
	home_team_name = main_node.get_home_team()
	
	home_team_label.text = 'Home' + ': ' + str(home_team_points) 
	
	clock_label.text = str(clock_remaining)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	home_team_points = main_node.get_team_points(home_team_name)
	home_team_label.text = 'Home' + ': ' + str(home_team_points) 
	
	clock_remaining = main_node.get_clock()
	clock_label.text = str(round(clock_remaining))
	
