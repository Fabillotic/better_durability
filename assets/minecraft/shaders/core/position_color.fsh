#version 150

in vec4 vertexColor;
in vec2 corner;
flat in float durability;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
	vec4 color = vertexColor;
	if (color.a == 0.0) {
		discard;
	}
	fragColor = color * ColorModulator;

	if(corner.x >= 0.0) {
		fragColor = vec4(corner.x, durability, corner.y, 1.0);
	}
}
