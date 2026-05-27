extends Area2D

signal collected

@onready var particles = $Particles

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		print("+1")
		collected.emit()
		$Sprite2D.visible = false # Deixa a moeda invisível
		$CollisionShape2D.set_deferred("disabled", true) # Desabilita o colisor
		particles.emitting = true # Ativa as partículas
		await particles.finished # Espera as partículas acabarem antes de seguir
		queue_free() #remova a moeda da cena
