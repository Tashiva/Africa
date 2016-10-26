///scr_fog()
// Tilepositionen abhängig von Spielerkoordinaten

//viewx/viewy: default variablen, die der pixlgröße des view bereichs von room0 entsprechen
//grid_view_x/y: anzahl zellen im grid vor/nach/vor/unter dem spieler bis zum rand
grid_view_x = (viewx/FOG_SIZE)/2;
grid_view_y = (viewy/FOG_SIZE)/2;

//xx/yy: "gerundete" x,y koordinaten ausgehend von spielerpostion
//grid_player_x/y: spieler koordinaten im grid 
xx = obj_player.x-obj_player.x%FOG_SIZE;
yy = obj_player.y-obj_player.y%FOG_SIZE;
grid_player_x = xx/FOG_SIZE;
grid_player_y = yy/FOG_SIZE;
var p = -1;

ds_grid_set_disk(global.grid_room0, grid_player_x, grid_player_y, sight, 2);
ds_grid_set_disk(global.grid_room0, grid_player_x, grid_player_y, sight-1, 3);

for (i=-1*grid_view_x;i<grid_view_x;i++) { 
    for (j=-1*grid_view_y;j<grid_view_y;j++) {
        var value = ds_grid_get(global.grid_room0,grid_player_x+i,grid_player_y+j);

        switch (value) {

            case 0: 
                global.grid_room0[#grid_player_x+i,grid_player_y+j] =1;
                tile_add(bg_fog,0,0,FOG_SIZE,FOG_SIZE,xx+(i*FOG_SIZE),yy+(j*FOG_SIZE),-16000);
            break;

            case 2:
                var tile = tile_layer_find(-16000,xx+i*FOG_SIZE,yy+j*FOG_SIZE);
                if (tile != -1)
                    tile_set_alpha(tile,0.5);
            break;

            case 3:
                var tile = tile_layer_find(-16000,xx+i*FOG_SIZE,yy+j*FOG_SIZE);
                if (tile != -1)
                    tile_delete(tile);
            break;
        
            default: 
            break;
        }
    }
}
