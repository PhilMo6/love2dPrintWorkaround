# love2dPrintWorkaround
A quick fix i came up with to get over not being able to use love.print in love2d.
Loads an alphanumeric sprite sheet image then uses anim8 to get the quads of the frames.
Creates a function game.print that when called breaks a string into characters and draws the corresponding quad to the screen.

