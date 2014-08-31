# Choc

[![Build Status](https://travis-ci.org/lynxluna/choc.svg?branch=master)](https://travis-ci.org/lynxluna/choc)

`choc` is a tool to remove object files from as iOS library or framework. It'll automatically scan, dissect, remove
unneeded object files from the library and then repack it back to the universal library.

[CocoaPods](http://cocoapods.org) has eliminated the friction of including dependencies to your iOS application.
But what happens if your project is a legacy code which embeds a static fat (a.k.a. universal) proprietary
framework or library which embeds another common opensource libraries inside their proprietary libs. This leads to
problem like duplicate object files and versioning. 

This small program will help you remove the unneeded objects and you can delegate the deps to CocoaPods and update
the dependencies as needed. This tool was born because of my frustation when doing contract work and finding out
many people includes compiled open source files to their  proprietary libraries preventing the client to update it.

## Installation

Choc is packaged as RubyGems. You can install it using `gem` command

```bash
$ gem install choc
$ rbenv rehash          # if you're using rbenv
```

From Source

```bash
$ bundle install
$ gem build choc.gemspec
$ gem install choc-0.1.0.gem
```

## Usage

Choc needs two input library and the object filenames to be removed

```bash
$ choc <library name> [<object list>...]
```

### Example: static universal library

```bash
$ choc libProprietary.a JSONKit.o
```

### Example: static framework

Usually the same with static universal library. Framework is just a directory. It usually located in the
`Versions/A/` and symlinked to `Versions/Current`

```bash
$ choc Proprietary.framework/Versions/A/Proprietary JSONKit.o
```

**TODO** : In the future this will be automatically detected

## License

The MIT License (MIT)

Copyright (c) 2014 Didiet Noor

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
