Feature: Parsing the output of Apple tools against an universal library and parse that library
  to appropriate ruby array

  Scenario: Extracting platforms from fat binary
    Given an iOS fat binary of libA.a
    Then extract the supported platforms
    And it should contains i386, x86_64, armv7, armv7s, arm64
    Then repack lib for i386 to /tmp removing add.o
    Then repack lib for x86_64 to /tmp removing add.o
    Then repack lib for armv7 to /tmp removing add.o
    Then repack lib for armv7s to /tmp removing add.o
    Then repack lib for arm64 to /tmp removing add.o
    Then make uberlib from /tmp


