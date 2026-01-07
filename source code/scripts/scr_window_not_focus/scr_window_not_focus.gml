/// @description						Check if window is not focused and return a value (this can be used to pause the game).
/// @return {Bool}

function scr_window_not_focus(){
	var enable_window_focus = true;
	
	return ((enable_window_focus) && ((!window_has_focus() or os_is_paused()) && (os_browser == browser_not_a_browser)));
}