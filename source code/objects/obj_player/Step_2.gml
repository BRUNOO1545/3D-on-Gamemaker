/// @description send camera pos

var _dist, _x, _y, _z;
_dist = 1;
_x = dcos(look_yaw) * dcos(look_pitch);
_y = -dsin(look_yaw) * dcos(look_pitch);
_z = dsin(look_pitch);

CAMERA.set_origin(
	x,
	y,
	z + (_dist / 2)
);

CAMERA.set_target(
	x + _x * _dist,
	y + _y * _dist,
	z + _z * _dist
);

CAMERA.set_roll(camera_roll);