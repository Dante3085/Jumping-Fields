extends Node2D

const Marker: PackedScene = preload("res://red_marker.tscn") 

var _distance_between_cells: int = 64
var _grid_size: int = 5

onready var _cursor: Cursor = $Cursor
onready var _player: Sprite = $Player

func _process(delta: float) -> void:
	_move_cursor()
	
	if Input.is_action_just_pressed("ui_accept"):
		_player.global_position = _cursor.global_position + Vector2(16, 16)
			
func _move_cursor() -> void:
	if Input.is_action_just_pressed("ui_right"):
		if _cursor.global_position.x == (_grid_size - 1) * _distance_between_cells:
			_cursor.global_position.x = 0
		else:
			_cursor.global_position += Vector2(_distance_between_cells, 0)
	elif Input.is_action_just_pressed("ui_left"):
		if _cursor.global_position.x == 0:
			_cursor.global_position.x = (_grid_size - 1) * _distance_between_cells
		else:
			_cursor.global_position += Vector2(-_distance_between_cells, 0)
	elif Input.is_action_just_pressed("ui_down"):
		if _cursor.global_position.y == (_grid_size - 1) * _distance_between_cells:
			_cursor.global_position.y = 0
		else:
			_cursor.global_position += Vector2(0, _distance_between_cells)
	elif Input.is_action_just_pressed("ui_up"):
		if _cursor.global_position.y == 0:
			_cursor.global_position.y = (_grid_size - 1) * _distance_between_cells
		else:
			_cursor.global_position += Vector2(0, -_distance_between_cells)
