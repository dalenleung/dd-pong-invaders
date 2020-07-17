extends Area2D

export(int) var Speed = 1000

var speed = 750
var player

func start(pos, dir, playerNumber):
	rotation = dir
	position = pos
	player = playerNumber
	
func _physics_process(delta):
	position += Vector2(
		cos(rotation) * speed * delta, 
		sin(rotation) * speed * delta
	)
	if (position.y < 100 or position.y > 490):
		print("off bounds")
		self.queue_free()
	
	if (player == "playerOne"):
		if (position.x > 830):
			print("scored player 2")
			self.queue_free()
			get_parent().get_child(2).adjust(1,true)
	else:
		if (position.x < 200):
			print("scored player 1")
			self.queue_free()
			get_parent().get_child(2).adjust(1,false)

func _on_Bullet_body_enter(body):
	print("yes")
	
func isBullet():
	return true
	
func getBulletOwner():
	return player


func _on_Bullet_area_entered(area):
	print("disappear")
