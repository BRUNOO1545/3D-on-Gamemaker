/// @description draw 3D world

// enable 3D render
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

draw_clear(c_black);

var _camera = camera_get_active();

var _view_matrix = matrix_build_lookat(
	camera.x, camera.y, camera.z, 
	camera.to_x, camera.to_y, camera.to_z, 
	0, 0, 1
);

var _roll_matrix = matrix_build(
	0, 0, 0,
	0, 0, camera.roll,
	1, 1, 1
);

camera_set_view_mat(_camera, matrix_multiply(_view_matrix, _roll_matrix));
camera_set_proj_mat(_camera, matrix_build_projection_perspective_fov(camera.fov, camera.aspect_ratio, 1, 32000));
camera_apply(_camera);

// disable 3D render
gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);