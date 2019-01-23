local arab = {1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000}
local roman = {'I','IV','V','IX','X','XL','L','XC','C','CD','D','CM','M'}

local function arabToRoman(number)
local val = ''
local i = #arab

	while ( number > 0 ) do
		if( number >= arab[i] ) then
			val = val .. roman[i]
			number = number - arab[i]
		else
			i = i - 1
		end
	end
	return val
end

local function romanToArab(str)	
local str = string.upper(str)
local val = 0
local i = #arab
local pos = 1
local newStr = str

	while ( i > 0 and #newStr > 0 ) do
		if ( newStr:sub(pos, #roman[i]) == roman[i] ) then
			val = val + arab[i]
			pos = pos + #roman[i]
			newStr = newStr:sub(pos, #newStr)
			pos = 1
			i = #arab
		else
			i = i - 1
		end
	end
	return val
end

local function convert(path)
	local file = io.open("arab.txt", "w")
	io.output(file)

	for line in io.lines(path) do
		io.write(romanToArab(line)..'\n')
	end

	file:close()

	local file = io.open("new_roman.txt", "w")
	io.output(file)

	for line in io.lines("arab.txt") do
		line = tonumber(line)
		io.write(arabToRoman(line) .. '\n')
	end
	file:close()
end

convert("roman.txt")
