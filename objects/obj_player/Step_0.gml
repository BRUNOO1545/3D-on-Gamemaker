/// @description movement and look

var _mouse_x = window_get_width() * 0.5;
var _mouse_y = window_get_height() * 0.5;

var _delta_x = window_mouse_get_x() - _mouse_x;
var _delta_y = window_mouse_get_y() - _mouse_y;

look_yaw -= _delta_x * look_sensibility;
look_pitch += _delta_y * look_sensibility * (mouse_invert ? -1 : 1);
look_pitch = clamp(look_pitch, -89, 89);

if (mouse_lock) window_mouse_set(window_get_width() / 2,  window_get_height() / 2);

if keyboard_check_pressed(vk_escape) mouse_lock = !mouse_lock;