extends Area2D

@export var speed = 400
@export var speed_multiplyer = 1
var screen_size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed * speed_multiplyer
	
	position += velocity * delta


func _on_body_entered(body: TileMap):
	if body is TileMap:
		speed_multiplyer = body.get_cell_tile_data(0, body.local_to_map(position.round())).get_custom_data_by_layer_id(0)
		

func _on_body_exited(body):
	if body is TileMap:
		speed_multiplyer = 1
