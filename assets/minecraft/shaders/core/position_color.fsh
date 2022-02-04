#version 150

#define PI 3.141592653589

in vec4 vertexColor;
in vec2 corner;
flat in float durability;

uniform vec4 ColorModulator;

#moj_import <config.glsl>

out vec4 fragColor;

void main() {
	vec4 color = vertexColor;
	if (color.a == 0.0) {
		discard;
	}
	fragColor = color * ColorModulator;

	if(corner.x >= 0.0) {
		//fragColor = vec4(corner.x, durability, corner.y, 1.0);
		vec2 f = corner * 2 - vec2(1.0);
		if(circular ? (length(f) >= 0.9 && length(f) <= 1.0) : (abs(f.x) >= 0.9 || abs(f.y) >= 0.9)) {
			float a = atan(f.y, f.x);
			a += (PI / 2);
			if(a < 0) a = 2 * PI + a;
			if(a / (2 * PI) <= durability) {
				fragColor = vertexColor;
			}
			else {
				fragColor = vec4(0.0, 0.0, 0.0, 1.0);
			}
		}
		else {
			discard;
		}
	}
}
