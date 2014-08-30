
.PHONY: clean

all: libA.a

%.o: ../%.c
	xcrun -sdk iphoneos $(CC) -arch arm64 -c $< -o $@

libA.a: add.o minus.o hello.o
	$(AR) rcs $@ $^

clean:
	rm *.o *.a
