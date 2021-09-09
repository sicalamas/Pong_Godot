extends KinematicBody2D

var speed = 300
var velocity = Vector2.ZERO

func _ready():
	randomVelocity()

func _physics_process(delta):
	var collisionObject = move_and_collide(velocity * speed * delta)
	if collisionObject:
		velocity = velocity.bounce((collisionObject.normal))
		if collisionObject.collider.name == "Player" || collisionObject.collider.name == "Opponent":
			speed = 750
		$BallSound.play()

func stopBall():
	speed = 0

func startBall():
	speed = 300
	randomVelocity()

func randomVelocity():
	randomize()
	velocity.x = [-0.9, 0.9, -1.0, 1.0][randi() % 4]
	velocity.y = [-0.6, 0.6, -0.7, 0.7, -0.8, 0.8, -0.9, 0.9, -1.0, 1.0][randi() % 10]

