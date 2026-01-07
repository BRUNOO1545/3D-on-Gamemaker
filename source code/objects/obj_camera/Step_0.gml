/// @description resize surface with window change

if scr_window_not_focus() exit;

var _w = window_get_width();
var _h = window_get_height();

if (_w != surf_w || _h != surf_h)
	{
		surf_w = _w;
		surf_h = _h;
		
		surface_resize(application_surface, surf_w, surf_h);
	}