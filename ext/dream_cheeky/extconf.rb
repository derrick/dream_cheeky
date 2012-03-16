require 'mkmf'

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

  create_makefile('dream_cheeky/dream_cheeky')

  # workaround for mkmf.rb in 1.9.2
  if RUBY_VERSION < "1.9.3"
    open("Makefile", "a") do |f|
      f.puts <<-EOS
.m.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -c $<
      EOS
    end
  end
else
  abort "Could not include required frameworks..."
end
