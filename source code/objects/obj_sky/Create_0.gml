/// @description make the floor size like the map

randomize();

skybox_size = 64000; // Cloud shader map size
skybox_color = make_colour_rgb(0, 0, 0);
skybox_speed_x = random_range(-1, 1);
skybox_speed_y = random_range(-1, 1);

x = room_width / 2;
y = room_height / 2;
depth = -1500;	// works as Z axis

shader = shd_clouds;
u_time =			shader_get_uniform(shader, "u_time");
u_tile_size =		shader_get_uniform(shader, "u_tile_size");
u_cloud_period =	shader_get_uniform(shader, "u_cloud_period");
u_cloud_speed_x =	shader_get_uniform(shader, "u_cloud_speed_x");
u_cloud_speed_y =	shader_get_uniform(shader, "u_cloud_speed_y");
u_cloud_colour =	shader_get_uniform(shader, "u_cloud_colour");