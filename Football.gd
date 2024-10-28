extends Area2D

var velocity = Vector2.ZERO
var ball_in_flight = false

@export var throw_power = 400  # The power applied to the throw

# Called when the ball is thrown
func throw_ball(direction: Vector2, from_player: Area2D):
	if not ball_in_flight:
		ball_in_flight = true
		self.visible = true
		velocity = direction * throw_power  # Apply velocity based on the direction
		var main_node = get_tree().root.get_child(0)  # Assuming 0 is the top-level node
		from_player.remove_child(self)  # Remove the football from the player
		main_node.add_child(self)
		set_global_position(from_player.global_position)  # Set the ball's position to the player's position
		print("Ball thrown from: ", from_player.name)
		get_node("CollisionShape2D").disabled = false  # Enable collisions while in flight

# Move the ball in _physics_process
func _physics_process(delta):
	if ball_in_flight:
		position += velocity * delta  # Move the football based on velocity

# Function to handle catching the ball
func _on_area_entered(area: Area2D):
	if ball_in_flight and area.name == "Player2":  # Check if Player 2 caught the ball
		print("Football caught by: ", area.name)
		ball_in_flight = false  # Stop the ball's movement
		velocity = Vector2.ZERO  # Stop the ball's velocity
		set_global_position(area.global_position)  # Set the ball's position to the player's position
		call_deferred("_move_football_to_player", area)
		call_deferred("_disable_collision_shape")  # Defer collision shape disabling
		self.visible = false
		print("Football reattached to: ", area.name)

# Move the football to the new player (Player2) after deferring
func _move_football_to_player(new_parent: Node):
	if self.get_parent() != new_parent:
		self.get_parent().remove_child(self)
		new_parent.add_child(self)

# Function to disable the collision shape after deferring
func _disable_collision_shape():
	get_node("CollisionShape2D").disabled = true  # Disable collision
