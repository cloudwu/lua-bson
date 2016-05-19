bson = require "bson"
local Utils = require "utils"

sub = bson.encode_order( "hello", 1, "world", 2 )

local function tbl_next(...)
	print("--- next.a", ...)
	local k, v = next(...)
	print("--- next.b", k, v)
	return k, v
end

local function tbl_pairs(obj)
	return tbl_next, obj.__data, nil
end

local obj_a = {
	__data = {
		[1] = 2,
		[3] = 4,
		[5] = 6,
	}
}

setmetatable(
	obj_a,
	{
		__index = obj_a.__data,
		__pairs = tbl_pairs,
	}
)

local obj_b = {
	__data = {
		[7] = 8,
		[9] = 10,
		[11] = obj_a,
	}
}

setmetatable(
	obj_b,
	{
		__index = obj_b.__data,
		__pairs = tbl_pairs,
	}
)

b = bson.encode {
	a = 1,
	b = true,
	c = bson.null,
	d = { 1,2,3,4 },
	e = bson.binary "hello",
	f = bson.regex ("*","i"),
	g = bson.regex "hello",
	h = bson.date (os.time()),
	i = bson.timestamp(os.time()),
	j = bson.objectid(),
	k = { a = false, b = true },
	l = {},
	m = bson.minkey,
	n = bson.maxkey,
	o = sub,
	p = 2^32-1,
	q = obj_b,
}

print "\n[before replace]"
t = b:decode()

for k,v in pairs(t) do
	local ty, val = bson.type(v)
	print("---", k, ty, val)
	if ty == 'table' then
			Utils.print_table(val)
	end
end

b:makeindex()
b.a = 2
b.b = false
b.h = bson.date(os.time())
b.i = bson.timestamp(os.time())
b.j = bson.objectid()

print "\n[after replace]"
t = b:decode()

for k,v in pairs(t) do
	local ty, val = bson.type(v)
	print("---", k, ty, val)
	if ty == 'table' then
			Utils.print_table(val)
	end
end

print("o.hello", bson.type(t.o.hello))
