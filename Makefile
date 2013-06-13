LUALIB=-I/usr/local/include -L/usr/local/bin -llua52
SOCKETLIB=-lws2_32

win: bson.dll

linux: bson.so

bson.dll : bson.c
	gcc --shared -Wall -O2 $^ -o$@ $(LUALIB) $(SOCKETLIB)

bson.so : bson.c
	gcc --shared -Wall -O2 $^ -o$@ 

clean:
	rm -f bson.dll bson.so