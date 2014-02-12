require 'mkmf'
require 'rbconfig'
require 'fileutils'

if RbConfig::CONFIG['host_os'] =~ /darwin/

  $CFLAGS << " " << "-ObjC"

  unless defined?(have_framework)
    def have_framework(fw, &b)
      checking_for fw do
        src = cpp_include("#{fw}/#{fw}.h") << "\n" "int main(void){return 0;}"
        if try_link(src, opt = "-ObjC -framework #{fw}", &b)
          $defs.push(format("-DHAVE_FRAMEWORK_%s", fw.tr_cpp))
          $LDFLAGS << " " << opt
          true
        else
          false
        end
      end
    end
  end

  if have_framework('CoreFoundation')
    $LDFLAGS << " -ObjC -framework IOKit"
    FileUtils.cp('hidapi.c.mac', 'hidapi.c')
    create_makefile('dream_cheeky/dream_cheeky')
  else
    abort "Could not include required frameworks..."
  end

else

  require 'pkg-config'

  if PKGConfig::exist?('libusb-1.0')
    $LIBS << ' ' << PKGConfig::libs('libusb-1.0')
    $CFLAGS << ' ' << PKGConfig::cflags('libusb-1.0')
    FileUtils.cp('hidapi.c.linux', 'hidapi.c')
    create_makefile('dream_cheeky/dream_cheeky')
  else
    abort 'Could not find library libusb'
  end

end

# workaround for mkmf.rb in 1.9.2
if RUBY_VERSION < "1.9.3"
  open("Makefile", "a") do |f|
    f.puts <<-EOS
.m.o:
  $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -c $<
    EOS
  end
end
