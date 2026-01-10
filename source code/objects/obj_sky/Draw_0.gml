/// @description draw texture

// background color
draw_rectangle_colour(x - (skybox_size / 2), y - (skybox_size / 2), x + (skybox_size / 2), y + (skybox_size / 2), skybox_color, skybox_color, skybox_color, skybox_color, false);

shader_set(shader);
	// set params
	shader_set_uniform_f(u_time, current_time / 1000);
	shader_set_uniform_f(u_tile_size, 4000.0);
	shader_set_uniform_f(u_cloud_period, 8.0);
	shader_set_uniform_f(u_cloud_speed_x, skybox_speed_x);
	shader_set_uniform_f(u_cloud_speed_y, skybox_speed_y);
	shader_set_uniform_f(u_cloud_colour, 135, 0, 95);
	
	draw_rectangle(x - (skybox_size / 2), y - (skybox_size / 2), x + (skybox_size / 2), y + (skybox_size / 2), false);
shader_reset();