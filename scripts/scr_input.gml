///scr_input


// gamepad control
if (gamepad_is_connected(0)) {
    move_right = gamepad_axis_value(0,gp_axislh) > 0.4;
    move_left = gamepad_axis_value(0,gp_axislh) < -0.4;
    move_down = gamepad_axis_value(0,gp_axislv) > 0.4;;
    move_up = gamepad_axis_value(0,gp_axislv) < -0.4;;
    attack_key = gamepad_button_check_pressed(0, gp_face2);
    action_key = gamepad_button_check_pressed(0, gp_face1);
    pause_key = gamepad_button_check_pressed(0, gp_start);
}

// keyboard control
else {
    move_right = keyboard_check(vk_right);
    move_left = keyboard_check(vk_left);
    move_up = keyboard_check(vk_up);
    move_down = keyboard_check(vk_down);
    attack_key = keyboard_check_pressed(ord('X'));
    action_key = keyboard_check_pressed(vk_enter);
    pause_key = keyboard_check_pressed(vk_escape);
    FS_key = keyboard_check_pressed(ord('F'));
    zoomin_key = keyboard_check_pressed(vk_add);
    zoomout_key = keyboard_check_pressed(vk_subtract);
}
