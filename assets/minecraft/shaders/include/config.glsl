#version 150

uniform vec2 ScreenSize;

//Change this value to your gui scale! (Can be found under Options -> Video Settings)
#define guiScale 2

//If false, durability will display in rectangle form
#define circular true

float yMax = ScreenSize.y / guiScale - 2;
float yMin = yMax - 7;
