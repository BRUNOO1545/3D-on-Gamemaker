varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform float u_time;
uniform float u_tile_size;
uniform float u_cloud_period;
uniform float u_cloud_speed_x;
uniform float u_cloud_speed_y;
uniform vec3 u_cloud_colour;

#define FBM_OCTAVES 5	// Octaves for FBM function

float randomizer(vec2 st) {
	return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

float periodic_noise(vec2 st, float period) {
	vec2 i = floor(st);
	vec2 f = fract(st);
	
	// interpolation
	float i_a = randomizer(mod(i, period));
	float i_b = randomizer(mod(i + vec2(1.0, 0.0), period));
	float i_c = randomizer(mod(i + vec2(0.0, 1.0), period));
	float i_d = randomizer(mod(i + vec2(1.0, 1.0), period));
	
	vec2 u = f * f * (3.0 - 2.0 * f);
	
	return mix(i_a, i_b, u.x) + (i_c - i_a) * u.y * (1.0 - u.x) + (i_d - i_b) * u.x * u.y;
}

float tiled_fbm(vec2 st, float period) {
	float val = 0.0;
	float amp = 0.5;
	
	for (int i = 0; i < FBM_OCTAVES; i++) {
		val += amp * periodic_noise(st, period);
		st *= 2.0;
		period *= 2.0;
		amp *= 0.5;
	}
	
	return val;
}

void main()
{
	// First cloud
	vec2 st = v_vPosition / (u_tile_size / u_cloud_period);
	
	vec2 cloud_movement = vec2(u_time * u_cloud_speed_x, u_time * u_cloud_speed_y);
	
	float cloud_density = tiled_fbm(st + cloud_movement, u_cloud_period);
	float cloud_alpha = smoothstep(0.4, 0.7, cloud_density) * 0.6;
	
	// Second cloud
	vec2 st_s = v_vPosition / ((u_tile_size * 1.5) / u_cloud_period / 2.0);
	
	vec2 cloud_movement_s = vec2(u_time * u_cloud_speed_x * 2.0, u_time * u_cloud_speed_y * 2.0);
	
	float cloud_density_s = tiled_fbm(st_s + cloud_movement_s, u_cloud_period / 1.8); //1.5
	float cloud_alpha_s = smoothstep(0.3, 0.8, cloud_density_s);
	
	// Mix final clouds
	float final_alpha = max(cloud_alpha, cloud_alpha_s);
    gl_FragColor = vec4(u_cloud_colour / 255.0, final_alpha * v_vColour.a);
}