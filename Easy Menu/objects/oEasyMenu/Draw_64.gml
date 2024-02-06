//draw title
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_set_font(title_font)
draw_text(display_get_gui_width()/2, display_get_gui_height()/2,title);
//draw button
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(button_font)
var _x = display_get_gui_width()/2,//x pos
	_y,//y pos
	_mx = device_mouse_x_to_gui(0),//mouse x on gui layer
	_my = device_mouse_y_to_gui(0),//mouse y on gui layer
	_w,//width of text in pixels
	_h;//height of text in pixels
button_lerp = lerp(button_lerp,1,0.2);
for(var i=0;i<array_length(button_list);i++){
	_w = string_width(button_list[i]);
	_h = string_height(button_list[i]);
	_y = display_get_gui_height()/2+string_height("T")*(i+0.5);
	var _sc = 1;
	//code for hovering
	if(point_in_rectangle(_mx, _my, _x-_w/2, _y-_h/2, _x+_w/2, _y+_h/2)){
		//swapping out old and new index
		if(button_index!=i){
			last_index = button_index
			button_index = i;
			button_lerp = 0;
		}
		
		//button clicked
		if(mouse_check_button_pressed(mb_left)){
			execute_button(i)
		}
	}
	
	if(button_index==i){//if button is being hovered
		_sc = 1+scale_increase*button_lerp;
	}else if(last_index==i){//if button was last hovered
		_sc = 1+scale_increase*(1-button_lerp)
	}
	
	//final draw code
	draw_text_transformed(_x, _y,button_list[i],_sc,_sc,0)
}