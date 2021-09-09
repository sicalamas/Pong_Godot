extends KinematicBody2D

var speed = 30000
var ball

func _ready():
	ball = get_parent().find_node("Ball")
	position.x = 1280 - 35
	
func _physics_process(delta):
	move_and_slide(Vector2(0, get_opponentDirection()) * speed * delta)

func get_opponentDirection():
	if abs(ball.position.y - position.y) > 8:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0
