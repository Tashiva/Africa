///scr_load_game()
var file = file_text_open_read(working_directory + "savegame.txt");
var save_string = file_text_read_string(file);
file_text_close(file);

save_string = base64_decode(save_string);
var save_data = json_decode(save_string);

var player_xstart = 0;
var player_ystart = 0;
with (obj_player_stats) {
    player_xstart = save_data[? "x"];
    player_ystart = save_data[? "y"];
    if (instance_exists(obj_player)) {
        obj_player.x = player_xstart;
        obj_player.y = player_ystart;
        obj_player.phy_position_x = player_xstart;
        obj_player.phy_position_y = player_ystart;
        obj_player.state = scr_move_state;
        obj_view.x = player_xstart;
        obj_view.y = player_ystart;
    } else {
        instance_create(player_xstart, player_ystart, obj_player);
    }
    hp = save_data[? "hp"];
    sanity = save_data[? "sanity"];
    maxsanity = save_data[? "maxsanity"];
    vorraete = save_data[? "vorraete"];
    ds_grid_read(global.grid_room0, save_data[? "grid"]);
}
room_goto(save_data[? "room"]);

ds_map_destroy(save_data);
