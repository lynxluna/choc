
.PHONY: clean

all: libA.a

%.o: ../%.c
	xcrun -sdk iphonesimulator $(CC) -arch i386 -c $< -o $@

libA.a: add.o minus.o hello.o
	$(AR) rcs $@ $^

clean:
	rm *.o *.a
