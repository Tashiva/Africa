// setting attack_state    
if (obj_input.attack_key) {
    image_index = 0;
    state = scr_attack_state;
}
     
// get the axis
var xaxis = (obj_input.move_right - obj_input.move_left);
var yaxis = (obj_input.move_down - obj_input.move_up);

// get the direction
dir = point_direction(0,0,xaxis, yaxis);

// get the speed
if (xaxis == 0 && yaxis == 0)
    spd = 0;
    else {
        spd = 5 * spd_modifier;
        scr_find_dir();
    }

// get the horizontal and vertical speeds
hspd = lengthdir_x(spd,dir);
vspd = lengthdir_y(spd,dir);

// move
phy_position_x += hspd;
phy_position_y += vspd;

// sprite control
image_speed = 0.3;
if (spd == 0) image_index = 0;

    switch (face) {
        case DOWN:
            sprite_index = spr_player_down;
            break;
        case UP:
            sprite_index = spr_player_up;
            break;
        case RIGHT:
            sprite_index = spr_player_right;
            break;        
        case LEFT:
            sprite_index = spr_player_left;
            break;        
        }

    

