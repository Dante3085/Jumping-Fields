class_name Cursor
extends Node2D

onready var _animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	_animation_player.play("idle")
