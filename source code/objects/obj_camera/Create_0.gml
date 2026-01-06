/// @description functions and vars

#macro CAMERA obj_camera

camera = {
	x: 0,
	y: 0,
	z: 0,
	to_x: 0,
	to_y: 0,
	to_z: 0,
	fov: 90,
	aspect_ratio: window_get_width() / window_get_height(),
	roll: 0
};

//test
camera.z = 100;
camera.to_x = room_width;
camera.to_z = room_height;

// GPU modes
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

#region vertext format setup

	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_normal();
	vertex_format_add_texcoord();
	vertex_format_add_colour();
	vformat = vertex_format_end();
	
	vbuffer = vertex_create_buffer();
	vertex_begin(vbuffer, vformat);

#endregion

// functions here

/// @description						Execute a function or script on draw GUI event of the 3D camera.
/// @param {Function, Asset.GMScript}	_code								Function or script for execution.
/// @return {Undefined}

function draw_on_gui(_code = undefined) {
	
	if is_undefined(_code) return;
	
	if is_method(_code) _code() else script_execute(_code);
}

/// @description		Change the camera configuration with a struct.
/// @param {Struct}		_new_config			Origin camera position of X coord.
/// @return {Undefined}

function set_config(_new_config) {
	self.camera = _new_config;
}

/// @description		Gets the current camera configuration.
/// @return {Struct}

function get_config() {
	return self.camera;
}

/// @description		Change the origin point of the camera.
/// @param {Real}		_x			Origin camera position of X coord.
/// @param {Real}		_y			Origin camera position of Y coord.
/// @param {Real}		_z			Origin camera position of Z coord.
/// @return {Undefined}

function set_origin(_x, _y, _z) {
	
	self.camera.x = _x;
	self.camera.y = _y;
	self.camera.z = _z;
}

/// @description		Get the current origin point of the camera.
/// @return {Struct}

function get_origin() {
	
	var _data = {
		x: self.camera.x,
		y: self.camera.y,
		z: self.camera.z
	}
	
	return _data;
}

/// @description		Change the target point of the camera focus.
/// @param {Real}		_x			Position to focus on X coord.
/// @param {Real}		_y			Position to focus on Y coord.
/// @param {Real}		_z			Position to focus on Z coord.
/// @return {Undefined}

function set_target(_x, _y, _z) {
	
	self.camera.to_x = _x;
	self.camera.to_y = _y;
	self.camera.to_z = _z;
}

/// @description		Get the current target point of the camera focus.
/// @return {Struct}

function get_target() {
	
	var _data = {
		x: self.camera.to_x,
		y: self.camera.to_y,
		z: self.camera.to_z
	}
	
	return _data;
}

/// @description		Change the camera fov.
/// @param {Real}		_value		New fov value (by default 90).
/// @return {Undefined}

function set_fov(_value) {
	self.camera.fov = _value;
}

/// @description		Get the current camera fov.
/// @return {Real}

function get_fov() {
	return self.camera.fov;
}

/// @description		Change the camera aspect ratio by using dividend and divisor values
///						For example: using a dividend of 16 and a divisor of 9, we get a 16/9 aspect ratio.
/// @param {Real}		_dividend	New dividend value (by default window width).
/// @param {Real}		_divisor	New divisor value (by default window height).
/// @return {Undefined}

function set_aspect_ratio(_dividend, _divisor) {
	self.camera.aspect_ratio = _dividend / _divisor;
}

/// @description		Change the camera aspect ratio.
/// @param {Real}		_value		New division value (by default window width divided by window height).
/// @return {Undefined}

function set_aspect_ratio_raw(_value) {
	self.camera.aspect_ratio = _value;
}

/// @description		Get the current camera aspect ratio.
/// @return {Real}

function get_aspect_ratio() {
	return self.camera.aspect_ratio;
}

/// @description		Change the camera roll effect.
/// @param {Real}		_value		New roll value (by default 0, no move).
/// @return {Undefined}

function set_roll(_value) {
	self.camera.roll = _value;
}

/// @description		Get the current camera roll.
/// @return {Real}

function get_roll() {
	return self.camera.roll;
}