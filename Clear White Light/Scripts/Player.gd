extends CharacterBody3D

@export var MoveSpeed:float = 1
@onready var Raycast:RayCast3D = $Camera3D/RayCast3D
var target:Vector3
signal playerMoved
var moving:bool = false


func _ready():
	playerMoved.connect(moved)

func _input(event):
	if !moving:
		var tween:Tween =create_tween().finished.connect(moved)
		if event.is_action_pressed("Forward"):
			tween.tween_property(self, "position", target, MoveSpeed).finished
		if event.is_action_pressed("Backward"):
			tween.tween_property(self, "position", target, MoveSpeed).from_current()
		if event.is_action_pressed("Turn_Left"):
			tween.tween_property(self, "rotation", target, MoveSpeed).from_current()
		if event.is_action_pressed("Turn_Right"):
			pass
		if event.is_action_pressed("Left"):
			pass
		if event.is_action_pressed("Right"):
			pass
			
func moved():
	moving = false
	
