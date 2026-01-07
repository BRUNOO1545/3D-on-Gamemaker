/// @description apply motion blur shader

var _camera = camera_get_active();

// create surface
if (!surface_exists(surf_prev))
	{
		surf_prev = surface_create(surf_w, surf_h);
		surface_set_target(surf_prev);
		draw_clear_alpha(c_black, 0);
		surface_reset_target();
	}

// save old matrix data
var _camera_matrix_view = matrix_get(matrix_view);
var _camera_matrix_proj = matrix_get(matrix_projection);

// reapply 3D camera
camera_apply(_camera);

// apply shader
shader_set(blur_shader);

var _u_currframe, _u_prevframe, _u_amount;
_u_currframe = shader_get_sampler_index(blur_shader, "u_currFrame");
_u_prevframe = shader_get_sampler_index(blur_shader, "u_prevFrame");
_u_amount = shader_get_uniform(blur_shader, "u_amount");

shader_set_uniform_f(_u_amount, blur_amount);
texture_set_stage(_u_currframe, surface_get_texture(application_surface));
texture_set_stage(_u_prevframe, surface_get_texture(surf_prev));

draw_surface(application_surface, 0, 0);

shader_reset();

// restore camera matrix
matrix_set(matrix_view, _camera_matrix_view);
matrix_set(matrix_projection, _camera_matrix_proj);

// save actual frame
surface_set_target(surf_prev);
draw_surface(application_surface, 0, 0);
surface_reset_target();