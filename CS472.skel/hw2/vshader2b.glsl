#version 330

in	vec2	a_Position;	// attribute variable: position vector
in	vec3	a_Color;	// attribute variable: color vector

out	vec4	v_Color;	// varying variable for passing color to fragment shader

uniform	mat4	u_Modelview;	// uniform variable for passing modelview  matrix
uniform	mat4	u_Projection;	// uniform variable for passing projection matrix
uniform	float	u_Theta;	// Theta parameter
uniform	int	u_Twist;	// Twist flag

void main() 
{
	// PUT YOUR CODE HERE


	// read position from center
	float distance = length(a_Position);

	// get color to fragment shader
	v_Color = vec4(a_Color, 1.0);

	// checking if Twist
	float angle = u_Theta; // if false twist then angle = theta
	if (u_Twist == 1) { // if true then final angle is theta * distance
		angle = u_Theta * distance;
	}


	float s = sin(angle);
	float c = cos(angle);
	
	// calculate x y positions using 2d rotation matrix
	float x_final = a_Position.x * c - a_Position.y * s;
	float y_final = a_Position.x * s + a_Position.y * c;

	// gl position is new coordinates * projection * model view
	gl_Position = u_Projection * u_Modelview * vec4(x_final, y_final, 0.0, 1.0);

}
