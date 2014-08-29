
.PHONY: i386 x86_64 armv7 armv7s arm64 fat

all:

fat:
	lipo -create -o libA.a libA-x86.a libA-x64.a libA-armv7.a libA-armv7s.a libA-arm64.a
	lipo -create -o libB.a libB-x86.a libB-x64.a libB-armv7.a libB-armv7s.a libB-arm64.a
	lipo -create -o libX.a libX-x86.a libX-x64.a libX-armv7.a libX-armv7s.a libX-arm64.a

add-x86.o : add.c
	$(CC) -arch i386 -c $< -o $@

add-x64.o : add.c
	$(CC) -arch x86_64 -c $< -o $@

add-armv7.o : add.c
	$(CC) -arch armv7 -c $< -o $@

add-armv7s.o : add.c
	$(CC) -arch armv7s -c $< -o $@

add-arm64.o : add.c
	$(CC) -arch arm64 -c $< -o $@

minus-x86.o : minus.c
	$(CC) -arch i386 -c $< -o $@

minus-x64.o : minus.c
	$(CC) -arch x86_64 -c $< -o $@

minus-armv7.o : minus.c
	$(CC) -arch armv7 -c $< -o $@

minus-armv7s.o : minus.c
	$(CC) -arch armv7s -c $< -o $@

minus-arm64.o : minus.c
	$(CC) -arch arm64 -c $< -o $@

hello-x86.o : hello.c
	$(CC) -arch i386 -c $< -o $@

hello-x64.o : hello.c
	$(CC) -arch x86_64 -c $< -o $@

hello-armv7.o : hello.c
	$(CC) -arch armv7 -c $< -o $@

hello-armv7s.o : hello.c
	$(CC) -arch armv7s -c $< -o $@

hello-arm64.o : hello.c
	$(CC) -arch arm64 -c $< -o $@

libA-x86.a: add-x86.o minus-x86.o
	$(AR) rcs $@ $^

libA-x64.a: add-x64.o minus-x64.o
	$(AR) rcs $@ $^

libA-armv7.a: add-armv7.o minus-armv7.o
	$(AR) rcs $@ $^

libA-armv7s.a: add-armv7s.o minus-armv7s.o
	$(AR) rcs $@ $^

libA-arm64.a: add-arm64.o minus-arm64.o
	$(AR) rcs $@ $^

libB-x86.a: add-x86.o hello-x86.o
	$(AR) rcs $@ $^

libB-x64.a: add-x64.o hello-x64.o
	$(AR) rcs $@ $^

libB-armv7.a: add-armv7.o hello-armv7.o
	$(AR) rcs $@ $^

libB-armv7s.a: add-armv7s.o hello-armv7s.o
	$(AR) rcs $@ $^

libB-arm64.a: add-arm64.o hello-arm64.o
	$(AR) rcs $@ $^

libX-x86.a: minus-x86.o 
	$(AR) rcs $@ $^

libX-x64.a: minus-x64.o 
	$(AR) rcs $@ $^

libX-armv7.a: minus-armv7.o 
	$(AR) rcs $@ $^

libX-armv7s.a: minus-armv7s.o 
	$(AR) rcs $@ $^

libX-arm64.a: minus-arm64.o 
	$(AR) rcs $@ $^

i386 : libA-x86.a libB-x86.a libX-x86.a

x86_64 : libA-x64.a libB-x64.a libX-x64.a

armv7 : libA-armv7.a libB-armv7.a libX-armv7.a

armv7s : libA-armv7s.a libB-armv7s.a libX-armv7s.a

arm64 : libA-arm64.a libB-arm64.a libX-arm64.a

clean:
	rm *.a
	rm *.o
