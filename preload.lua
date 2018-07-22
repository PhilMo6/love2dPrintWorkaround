game = {}
game.config = {}
game.images = {}
game.alphanumerics = {}

game.images['alpha'] = love.graphics.newImage('alphanumericFull.png')
game.config.alphaOffsetX,game.config.alphaOffsetY = 62,55

local g = anim8.newGrid(game.config.alphaOffsetX,game.config.alphaOffsetY, game.images['alpha']:getWidth(), game.images['alpha']:getHeight())
local charOffset = string.byte("A")
for i,v in ipairs(g('1-10',1,'1-10',2,'1-6',3)) do 
	game.alphanumerics[string.char(charOffset)]=v
	charOffset = charOffset + 1
 end
 
local charOffset = string.byte("a")
for i,v in ipairs(g('1-10',4,'1-10',5,'1-6',6)) do 
	game.alphanumerics[string.char(charOffset)]=v
	charOffset = charOffset + 1
 end
 
local charOffset = string.byte("0")
for i,v in ipairs(g('1-10',7)) do 
	game.alphanumerics[string.char(charOffset)]=v
	charOffset = charOffset + 1
 end
 
local frames = g('1-9',8)
game.alphanumerics['!']=frames[1]
game.alphanumerics['?']=frames[2]
game.alphanumerics['#']=frames[3]
game.alphanumerics['%']=frames[4]
game.alphanumerics['(']=frames[5]
game.alphanumerics[')']=frames[6]
game.alphanumerics['.']=frames[7]
game.alphanumerics[':']=frames[8]
game.alphanumerics[' ']=frames[9]

 --use this instead of love.print
 function game.print(string,x,y,flip,scale)
	local count = 0
	local x = flip and x - string.len(string) * game.config.alphaOffsetX or x
	scale = scale or 1
	local offset = game.config.alphaOffsetX * scale
	for i in string.gfind(string, ".") do
		count = count + 1
		love.graphics.draw(game.images['alpha'],game.alphanumerics[i] or game.alphanumerics[' '], x + (offset * count), y,0,scale,scale)
	end
 end