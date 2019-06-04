extends Area2D

export var speed = 400  
var screen_size  

signal hit

func _ready():
	screen_size = get_viewport_rect().size # pega o tamanho da tela
	hide()

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$sprite.play()
	else:
		$sprite.stop()
	
	# Seta a posição do player
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x) # limita o movimento na tela no eixo x
	position.y = clamp(position.y, 0, screen_size.y) # limita o movimento na tela no eixo y
	
	if velocity.x != 0:
		$sprite.animation = "right"
		$sprite.flip_v = false
		 # See the note below about boolean assignment
		$sprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$sprite.animation = "up"
		$sprite.flip_v = velocity.y > 0


func _on_player_body_entered(body):
	hide()
	emit_signal("hit")
	$shape.set_deferred("disabled", true) # Desabilita o CollisionShape2D de forma segura
	

func start(pos):
	position = pos
	show()
	$shape.disabled = false