extends RigidBody2D

export var min_speed = 150  # Minimo speed range.
export var max_speed = 250  # Máximo speed range.
var mob_types = ["walk", "swim", "fly"] # Lista dos nomes das animaçõs do inimigo


func _ready():
	# A expressão randi() % n é a forma padrão do godot 
	# de obter um número inteiro aleatório entre 0 e n-1.
	
	# Determina a animação do inimigo de forma aleatória.
	$sprite.animation = mob_types[randi() % mob_types.size()]
	

func _on_start_game():
	queue_free()

func _on_visibility_screen_exited():
	queue_free()
