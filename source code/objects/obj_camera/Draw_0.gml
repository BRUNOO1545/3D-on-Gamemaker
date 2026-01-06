/// @description draw 3D world

draw_clear(c_black);

var _camera = camera_get_active();
camera_set_view_mat(_camera, matrix_build_lookat(camera.x, camera.y, camera.z, camera.to_x, camera.to_y, camera.to_z, 0, 0, 1));
camera_set_proj_mat(_camera, matrix_build_projection_perspective_fov(camera.fov, camera.aspect_ratio, 1, 32000));
camera_apply(_camera);