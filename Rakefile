require "bundler/gem_tasks"
require 'rake/clean'
require 'rspec/core/rake_task'
require 'rbconfig'

NAME = 'dream_cheeky'

DL_EXTENSION = RbConfig::CONFIG['DLEXT']

# rule to build the extension: this says
# that the extension should be rebuilt
# after any change to the files in ext
file "lib/#{NAME}/#{NAME}.#{DL_EXTENSION}" => Dir.glob("ext/#{NAME}/*{.rb,.c}") do
  Dir.chdir("ext/#{NAME}") do
    # this does essentially the same thing
    # as what RubyGems does
    ruby "extconf.rb"
    sh "make"
  end
  cp "ext/#{NAME}/#{NAME}.#{DL_EXTENSION}", "lib/#{NAME}"
end

# make the :test task depend on the shared
# object, so it will be built automatically
# before running the tests
task :rspec => "lib/#{NAME}/#{NAME}.#{DL_EXTENSION}"

# use 'rake clean' and 'rake clobber' to
# easily delete generated files
CLEAN.include("ext/**/*{.o,.log,.#{DL_EXTENSION}")
CLEAN.include('ext/**/Makefile')
CLOBBER.include("lib/**/*.#{DL_EXTENSION}")

RSpec::Core::RakeTask.new(:rspec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['-cfs --backtrace']
end

desc "Run specs"
task :default => :rspec
