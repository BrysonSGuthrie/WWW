extends CharacterBody3D

var M = 5
const SPEED = 0.02
const JUMP_VELOCITY = 7.5
@onready var shader = $MeshInstance3D.get_active_material(0)
@onready var syringe = $syringe
var direction = null
var turn = 0.05
var syringe_state = false #false is empty true is full
var syring_in_use = false #syringe is animating 
func _physics_process(delta: float) -> void:
	#print(rad_to_deg(rotation.y),"kill")
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_pressed("ui_right"):
		rotation.y -= turn
		await get_tree().create_timer(0.2).timeout
	if Input.is_action_pressed("ui_left"):
		await get_tree().create_timer(0.2).timeout
		rotation.y += turn
	if Input.is_action_pressed("ui_up") and not ( Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")):
		var pos = $point.global_position
		var max_distance = SPEED  # You can adjust this value based on how fast or far you want the object to move
		var new_pos = global_position.move_toward(pos, max_distance)
		
		# Set the new position
		await get_tree().create_timer(0.001).timeout
		global_position = new_pos
		

	
	if Input.is_action_just_pressed("r") and not syringe_state and not syring_in_use:
		syring_in_use = true
		syringe.eject()
		syringe_state = true
		await get_tree().create_timer(0.5833).timeout
		syring_in_use = false
	print(syring_in_use)
	if Input.is_action_just_pressed("l_click") and syringe_state and not syring_in_use:
		syringe_state = true
		syringe.inject()
		syringe_state = true
		await get_tree().create_timer(0.5833).timeout
		syringe_state = false
		



		
	move_and_slide()


func _on_area_3d_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	print("player collided")
