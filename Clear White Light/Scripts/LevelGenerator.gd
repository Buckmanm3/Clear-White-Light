@tool
extends Node3D

const CellScene = preload("res://Scenes/Cell.tscn")
var cells:Array = []
@onready var map: TileMap = $Map

func _ready():
	var tiles: Array[Vector2i] = map.get_used_cells(0)
	for tile:Vector2i in tiles:
		var cell = CellScene.instantiate()
		add_child(cell)
		cell.transform.origin = Vector3(tile.x, 0, tile.y)
		cells.append(cell)
	for cell in cells:
		cell.updateFaces(tiles)
		print(cells)
