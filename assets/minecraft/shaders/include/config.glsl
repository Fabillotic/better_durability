#version 150

uniform vec2 ScreenSize;

#define guiScale 2

float yMax = ScreenSize.y / guiScale - 2;
float yMin = yMax - 7;
