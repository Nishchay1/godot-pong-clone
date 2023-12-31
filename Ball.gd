extends KinematicBody2D

var speed = 400
var velocity = Vector2.ZERO

func _ready():
	randomize()
	velocity.x = [-1,1][randi()%2]
	velocity.y = [-0.8,0.8][randi()%2]

func _physics_process(delta):
	var collision_object = move_and_collide(velocity*speed*delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		$HitSound.play()

func stop_ball():
	speed = 0

func start_ball():
	speed = 400
	velocity.x = [-1,1][randi()%2]
	velocity.y = [-0.8,0.8][randi()%2]
