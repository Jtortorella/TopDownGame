const SPEED := 6000.0
const ZERO_VECTOR := Vector2.ZERO
const DirectionVectors := {
	"Down": Vector2(0, 1),
	"Up": Vector2(0, -1),
	"Left": Vector2(-1, 0),
	"Right": Vector2(1, 0)
}
const PlayerState = [
	'Attack', 'Idle', 'Walk'
]
const Animations := {
	"Walk": [
		"Down", "Up", "Left", "Right"
	],
	"Attack": {
		"Down": "AttackF",
		"Up": "AttackB",
		"Left": "AttackL",
		"Right": "AttackR"
	},
	"Idle": {
		"Down": "IdleF",
		"Up": "IdleB",
		"Left": "IdleL",
		"Right": "IdleR"
	}
}
