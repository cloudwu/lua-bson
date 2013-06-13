bson = require "bson"

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
}

t = b:decode()

for k,v in pairs(t) do
	print(k, bson.type(v))
end
