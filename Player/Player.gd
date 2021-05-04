extends KinematicBody2D

var velocity = Vector2.ZERO
var push = 11000
var push_1 = push

const SPEED = 180
const GRAVITY = 30
const JUMP_POWER: int = -500

func _physics_process(delta):
	if Input.is_action_pressed("Quit"):
		get_tree().change_scene("res://MainMenu.tscn")
# verifica se a tecla ui_left ou right foram pressionadas guarda valor no eixo vector 2
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
# definindo a gravidade
	velocity.y = velocity.y + GRAVITY
# move o personagem em um eixo vector 2
	velocity = move_and_slide(velocity, Vector2.UP,false, 4, PI/4, false)
	velocity.x =  lerp(velocity.x, 0, 0.2)
	
# aplica impulso somente ao collidir com a tábua
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name==("Tábua"):
			collision.collider.apply_impulse(Vector2(0, 0), Vector2(0, (-1* push_1)))
			# lerp para reduzir o impulse a 0 enquanto em colisão com a tábua
			push_1 = lerp(push_1, 0, 1)

	
#deslocamento = move_and_slide(deslocamento, Vector2.UP, false, 4, PI/4, false)
# define desaceleração do movimento através de interpolação linear

# verifica se o botao pular foi pressionado e se o personagem esta em descanço no eixo Y
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_POWER
		# Reseta o impulse toda vez q pula 
		push_1 = push

