extends CharacterBody2D


const SPEED = 200
func _process(_delta):
    var direction = Vector2.RIGHT
    velocity = SPEED * direction
    move_and_slide()
    
