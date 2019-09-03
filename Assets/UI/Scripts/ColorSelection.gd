extends HBoxContainer

onready var selected_color := $TextureRect/SelectedColor
onready var choices := $Choices

func _ready() -> void:
	for choice in choices.get_children():
		choice.connect("gui_input", self, "_on_choice_gui_input", [choice])
		
		if choice.color_to_faction == Global.faction:
			selected_color.color = choice.color

func _on_choice_gui_input(event, choice) -> void:
	if event is InputEventMouseButton and event.pressed:
		Audio.play_snd("click")
		selected_color.color = choice.color
		
#		var i = 1
#		for choice in choices.get_children():
#			if selected_color.color == choice.color:
#				Global.faction = i
#				break
#			i += 1
		Global.faction = choice.color_to_faction
