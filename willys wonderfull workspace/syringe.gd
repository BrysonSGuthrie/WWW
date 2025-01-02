extends Node3D

@onready var M = $Cylinder.get_active_material(0)
@onready var anim = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	eject()


# Called every frame. 'delta' is the elapsed time since the previous frame.

func map_value(value: float, in_min: float, in_max: float, out_min: float, out_max: float) -> float:
	return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
func _process(delta: float) -> void:
	var pos = $Plane_001.position.y
	var liquid_y = map_value(pos,2.283,4.494,-478.915,8.18)
	#print(liquid_y," ",pos)
	M.set_shader_parameter ("liquid_hight",liquid_y)
	#if Input.is_action_just_pressed("ui_up"):
		#eject()
	#if Input.is_action_just_pressed("ui_down"):
		#inject()
func eject():
	anim.play("eject")
func inject():
	anim.play("ineject")
#-0.435
#1.865
#2.283
#4.494
