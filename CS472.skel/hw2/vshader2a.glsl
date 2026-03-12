#version 330

in	vec2	a_Position;	// attribute variable
uniform	mat4	u_Projection;	// uniform variable for passing projection matrix

void main() 
{
	// PUT YOUR CODE HERE

	// gl_PointSize = 4.0;
	
	// multiply the position by project matrix
	gl_Position = u_Projection * vec4(a_Position, 0.0, 1.0);
}

