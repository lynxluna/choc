
.PHONY: i386 x86_64 armv7 armv7s arm64 fat clean

all: fat

i386:
	cd i386 && $(MAKE)

x86_64:
	cd x86_64 && $(MAKE)

armv7:
	cd armv7 && $(MAKE)

armv7s:
	cd armv7s && $(MAKE)

arm64:
	cd arm64 && $(MAKE)

clean:
	cd i386 && $(MAKE) clean
	cd armv7 && $(MAKE) clean
	cd armv7s && $(MAKE) clean
	cd arm64 && $(MAKE) clean
	cd x86_64 && $(MAKE) clean
	rm libs/*.a

fat: i386 x86_64 armv7 armv7s arm64
	xcrun -sdk iphoneos lipo -create i386/libA.a armv7/libA.a armv7s/libA.a arm64/libA.a x86_64/libA.a -o libs/libA.a



