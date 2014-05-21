bson = require "bson"

sub = bson.encode_order( "hello", 1, "world", 2 )

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
}

t = b:decode()

for k,v in pairs(t) do
	print(k, bson.type(v))
end

b:makeindex()
b.a = 2
b.b = false
b.h = bson.date(os.time())
b.i = bson.timestamp(os.time())
b.j = bson.objectid()

print "after replace"

t = b:decode()

for k,v in pairs(t) do
	print(k, bson.type(v))
end

print("o.hello", bson.type(t.o.hello))