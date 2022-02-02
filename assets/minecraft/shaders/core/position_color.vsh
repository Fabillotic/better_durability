#version 150

#define yMin 336
#define yMax 340

in vec3 Position;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out vec4 vertexColor;
out vec2 corner;
flat out float durability;

void main() {
	gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
	
	durability = -1.0;
	corner = vec2(-1.0);
	if(Position.z == 0 && Position.y > yMin && Position.y < yMax) {
		if(Color == vec4(0.0, 0.0, 0.0, 1.0)) {
		}
		else {
			if(Color.r == Color.g) durability = 0.5;
			else if(Color.r < Color.g) {
				durability = 1 - (Color.r / 2.0);
			}
			else if(Color.g < Color.r) {
				durability = (Color.g / 2.0);
			}
			vec2[4] corners = vec2[4] (vec2(0.0), vec2(0.0, 1.0), vec2(1.0, 1.0), vec2(1.0, 0.0));
			corner = corners[gl_VertexID % 4];
			if(gl_VertexID % 4 == 0 || gl_VertexID % 4 == 3) {
				gl_Position += ProjMat * ModelViewMat * vec4(0.0, -12.0, 0.0, 0.0);
			}
			if(gl_VertexID % 4 == 1 || gl_VertexID % 4 == 2) {
				gl_Position += ProjMat * ModelViewMat * vec4(0.0, 1.0, 0.0, 0.0);
			}
			if(gl_VertexID % 4 < 2) {
				gl_Position += ProjMat * ModelViewMat * vec4(-1.0, 0.0, 0.0, 0.0);
			}
			else {
				gl_Position += ProjMat * ModelViewMat * vec4(13.0 * (1 - durability), 0.0, 0.0, 0.0);
			}
		}
	}
	
	vertexColor = Color;
}
