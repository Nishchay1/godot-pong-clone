extends Node

var PlayerScore = 0
var OpponentScore = 0

func _ready():
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()
	$Player.position.x = 1280-35
	$Opponent.position.x = 35
	$Player.position.y = 360
	$Opponent.position.y = 360

func _on_LeftWall_body_entered(body):
	PlayerScore += 1
	score_achieved()

func _on_RightWall_body_entered(body):
	OpponentScore += 1
	score_achieved()

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)

func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup', 'start_ball')

func score_achieved():
	$Ball.position = Vector2(640,360)
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()
	$ScoreSound.play()
	$Player.position.x = 1280-35
	$Opponent.position.x = 35
	$Player.position.y = 360
	$Opponent.position.y = 360
