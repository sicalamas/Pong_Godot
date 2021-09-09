extends Node

var PlayerScore = 0
var OpponentScore = 0

func _on_AreaLeft_body_entered(body):
	score_achieved(true)

func _on_AreaRight_body_entered(body):
	score_achieved(false)

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	$TimerLabel.text = str(int($Timer.time_left * 10))

func _on_Timer_timeout():
	get_tree().call_group("BallGroup", "startBall")
	$TimerLabel.visible = false

func score_achieved(var playerSide):
	if playerSide:
		OpponentScore += 1
	else:
		PlayerScore += 1
	$Ball.position = Vector2(640, 360)
	$Ball.stopBall()
	#get_tree().call_group("BallGroup", "stopBall")
	$Timer.start()
	$TimerLabel.visible = true
	$ScoreSound.play()
	$Player.position.x = 35
	$Opponent.position.x = 1280 - 35
