///scr_save_game()
if (!object_exists(obj_player_stats)) exit;

// Dict for the data to save
var save_data = ds_map_create();

with (obj_player_stats) {
    save_data[? "room"] = prev_room;
    save_data[? "x"] = paused_xpos;
    save_data[? "y"] = paused_ypos;
    save_data[? "hp"] = hp;
    save_data[? "sanity"] = sanity;
    save_data[? "maxsanity"] = maxsanity;
    save_data[? "vorraete"] = vorraete;
}

ini_open("Save.ini");
ini_write_string("Save", "0", ds_grid_write(global.grid_room66));
ini_close();
//save_data[? "grid"] = ds_grid_write(global.grid_room0);

var save_string = json_encode(save_data);
ds_map_destroy(save_data);
save_string = base64_encode(save_string);

var file = file_text_open_write(working_directory + "savegame.txt");
file_text_write_string(file,save_string);
file_text_close(file);










show_message("Game saved");
