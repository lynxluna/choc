
all: libA.a

%.o: ../%.c
	xcrun -sdk iphonesimulator $(CC) -arch x86_64 -c $< -o $@

libA.a: add.o minus.o hello.o
	$(AR) rcs $@ $^

clean:
	rm *.o *.a
