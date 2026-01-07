/// @description apply motion blur

// create or resize surface
var _gui_w, _gui_h;
_gui_w = display_get_gui_width();
_gui_h = display_get_gui_height();

if (!surface_exists(surf_prev))
	{
		surf_prev = surface_create(_gui_w, _gui_h);
	}
else if (surface_get_width(surf_prev) != _gui_w || surface_get_height(surf_prev) != _gui_h)
	{
		surface_resize(surf_prev, _gui_w, _gui_h);
	}

// set shader
shader_set(blur_shader);

var _u_currframe, _u_prevframe, _u_amount;
_u_currframe = shader_get_sampler_index(blur_shader, "u_currFrame");
_u_prevframe = shader_get_sampler_index(blur_shader, "u_prevFrame");
_u_amount = shader_get_uniform(blur_shader, "u_amount");

shader_set_uniform_f(_u_amount, blur_amount);
texture_set_stage(_u_currframe, surface_get_texture(application_surface));
texture_set_stage(_u_prevframe, surface_get_texture(surf_prev));

draw_surface_stretched(application_surface, 0, 0, _gui_w, _gui_h);

shader_reset();

// update last
surface_set_target(surf_prev);
gpu_set_blendenable(false);
draw_surface_stretched(application_surface, 0, 0, _gui_w, _gui_h);
gpu_set_blendenable(true);
surface_reset_target();