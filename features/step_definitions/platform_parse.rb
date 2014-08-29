require 'choc_tools'
require 'set'

Given(/^an iOS fat binary of (lib.+)$/) do |filename|
  @filename = filename
  @fullPath = "#{Dir.pwd}/tester/libs/#{filename}"
end

Then(/^extract the supported platforms$/) do
  @platforms = Choc::extract_platforms(@fullPath)
  expect(@platforms).not_to be_nil
  expect(@platforms).not_to be_empty
end

Then(/^it should contains (.*)$/) do |platforms|
  platset = (platforms.split(',').map {|p| p.strip}).to_set
  expect(@platforms).equal?(platset)
end


Then(/^repack lib for (armv7|armv7s|arm64|i386|x86_64) to (.+) removing add\.o$/) do |platform, dest|
  expect(Choc::extract_lib(@fullPath, platform, dest)).to be_truthy

  p_libname = Choc::platform_libname(@fullPath, platform, dest)
  expect(File.exist?(p_libname)).to be_truthy
  p_dirname="#{dest}/#{platform}"
  
  if (not File.exist?(p_dirname)) 
      FileUtils.mkdir(p_dirname)
  end

  expect(Choc::extract_objects(p_libname, p_dirname)).to be_truthy 
  FileUtils.rm Dir.glob("#{p_dirname}/add*.o")
  expect(Choc::arlib(p_libname, p_dirname)).to be_truthy

  new_objs = Choc::list_objects(p_libname)
  expect(new_objs.select {|obj| obj.match(/^add(.*)\.o$/) != nil}).to be_empty
end


Then(/^make uberlib from (.+)$/) do |srcdir|
  temp_destlib = "#{Dir.pwd}/#{@filename}"
  expect(Choc::make_uberlib(temp_destlib, srcdir)).to be_truthy
  expect(File.exists?(temp_destlib)).to be_truthy
end
