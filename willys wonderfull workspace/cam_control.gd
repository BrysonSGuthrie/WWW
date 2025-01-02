extends Node3D

var cam = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cam = 1
	$cam_1.current = true
var cam_count = 2

func _process(delta: float) -> void:
	var current_cam = get_node("cam_"+str(cam))

	for i in range(cam_count):
		get_node("cam_"+str(i+1)).current = false
	current_cam.current = true
	#print(cam,"current_cam")





func _on_area_2_body_entered(body: Node3D) -> void:
	pass

func _on_area_1_body_entered(body: Node3D) -> void:
	cam = 1
	print("ligma1")


func _on_area_3_body_entered(body: Node3D) -> void:
	cam = 3
