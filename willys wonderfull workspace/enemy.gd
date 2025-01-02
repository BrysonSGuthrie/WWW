extends CharacterBody3D


const speed = 1.5
const accl = 1.2

@onready var nav = $NavigationAgent3D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var direction = Vector3()
	var player_pos = get_parent().get_node("Player").global_position
	nav.target_position = player_pos
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed,accl * delta)


	move_and_slide()


func _on_area_3d_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
