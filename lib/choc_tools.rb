require 'set'
module Choc
  def self.extract_platforms(filename)
    output = `lipo -info #{filename}`
    if ($?.exitstatus == 0) 
      return output.chop.split(':').last.strip.split(' ').to_set
    else
      return nil
    end
  end
  
  def self.platform_libname(filename, platform, dest) 
    outname = "#{dest}/#{File.basename(filename, '.*')}-#{platform}#{File.extname(filename)}"
    return outname
  end

  def self.extract_lib(filename, platform, dest)
    plats = Choc::extract_platforms(filename)
    valid = plats.include?(platform)
    outname = Choc::platform_libname(filename, platform, dest)

    if valid
      cmd = "lipo -thin #{platform} #{filename} -o #{outname}"
      return system(cmd)
    else
      return nil
    end
  end

  def self.list_objects(platform_lib)
    ar_out = `ar -t #{platform_lib}`  
    return ar_out.split("\n").select { |filename| File.extname(filename) == ".o" } 
  end

  def self.extract_objects(platform_lib, dest)
    cmd = "cd #{dest} && ar -x #{platform_lib}"
    return system(cmd)
  end

  def self.arlib(platform_lib, object_dir)
    if File.exists?(platform_lib)
      FileUtils.rm platform_lib
    end
    cmd = "ar rcs #{platform_lib} #{object_dir}/*.o"
    return system(cmd)
  end

  def self.make_uberlib(destlib, srcdir)
    platforms = ["i386", "x86_64", "armv7", "armv7s", "arm64"]
    all_platform_libs = platforms.map { |p| Choc::platform_libname(destlib, p, srcdir) }
    platform_libs = all_platform_libs.select { |l| File.exists?(l) }
    cmd = "lipo -create #{platform_libs.join(" ")} -o #{destlib}"
    return system(cmd)
  end
end

