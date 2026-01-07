/// @description movement and look

var _mouse_x = window_get_width() * 0.5;
var _mouse_y = window_get_height() * 0.5;

var _delta_x = window_mouse_get_x() - _mouse_x;
var _delta_y = window_mouse_get_y() - _mouse_y;

if (mouse_lock)
	{
		look_yaw -= _delta_x * look_sensibility;
		look_pitch += _delta_y * look_sensibility * (mouse_invert ? -1 : 1);
		look_pitch = clamp(look_pitch, -89, 89);
		window_mouse_set(window_get_width() * 0.5,  window_get_height() * 0.5);
	}

if keyboard_check_pressed(vk_escape)
	{
		mouse_lock = !mouse_lock;
		window_set_cursor(mouse_lock ? cr_none : cr_arrow);
	}

// player movement
var _key_forward, _key_strafe, _spd;
_key_forward =	keyboard_check(ord("W")) - keyboard_check(ord("S"));
_key_strafe =	keyboard_check(ord("A")) - keyboard_check(ord("D"));

// player speed / boost
_spd = player_spd;
if keyboard_check(vk_shift) _spd = player_spd_boost;

// normalize the diagonal input
var _len = point_distance(0, 0, _key_forward, _key_strafe);

if (_len > 1)
	{
		_key_forward /= _len;
		_key_strafe /= _len;
	}

// move based on yaw
var _yaw_fx, _yaw_fy, _yaw_sx, _yaw_sy;
_yaw_fx = lengthdir_x(1, look_yaw);
_yaw_fy = lengthdir_y(1, look_yaw);
_yaw_sx = lengthdir_x(1, look_yaw + 90);
_yaw_sy = lengthdir_y(1, look_yaw + 90);

// make final vector and apply to current pos
x += (_yaw_fx * _key_forward + _yaw_sx * _key_strafe) * _spd;
y += (_yaw_fy * _key_forward + _yaw_sy * _key_strafe) * _spd;

// Quake style camera roll
var _target_roll = _key_strafe * -camera_roll_angle;
camera_roll = lerp(camera_roll, _target_roll, 0.15);