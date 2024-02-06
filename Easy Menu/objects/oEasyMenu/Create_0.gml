next_room = EasyMenuRoom;//choose which room pressing play brings you to
bg_color = c_gray;
title = "Game";//title to be displayed
button_list = [//list of button names
"Play",
"Quit"
]

title_font = EasyMenuAgency96;//font for title
button_font = EasyMenuAgency32;//font for buttons
bg_image = -1;//display a sprite in the bg

scale_increase = 0.1;//how much button expands by when hovered, scale_increase = 0.1 -> scale_when_hovered = 1+0.1
button_index = -1;//index for which button is hovered and highlighted
button_lerp = 0;//lerp value for increasing hovered text size smoothly
last_index = -1;//index for which button was last hovered to create smooth transition effect

//controls what happens when buttons are pressed
//index is equal to index of button list
execute_button = function(_ind){
	switch(_ind){
		case 0://play
			room_goto(next_room)
		break;
		case 1://quit
			game_end();
		break;
	}
}

//sets background color
var background = layer_background_get_id(layer_get_id("Background"));
layer_background_blend(background, bg_color)