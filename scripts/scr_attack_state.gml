///scr_attack_state
image_speed = 0.5;

switch (sprite_index) {
    case spr_player_right:
        sprite_index = spr_player_attack_right;
        break;
    case spr_player_left:
        sprite_index = spr_player_attack_left;
        break;
    case spr_player_up:
        sprite_index = spr_player_attack_up;
        break;
    case spr_player_down:
        sprite_index = spr_player_attack_down;
        break;                    
    }

if (image_index >= 3 && attacked == false) {
    var xx = x;
    var yy = y;
    switch (sprite_index) {
        case spr_player_attack_right:
            xx += 10;
            break;
        case spr_player_attack_left:
            xx -= 10;
            break;
        case spr_player_attack_up:
            yy -= 12;
            break;
        case spr_player_attack_down:
            yy += 12;
            break;                    
        }

    /*var damage = instance_create(xx, yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
    attacked = true;*/
    }
    
if (image_index >= 6) {
    state = scr_move_state;
    attacked = false;
}

