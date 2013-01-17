# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dream_cheeky/version"
require 'rbconfig'

Gem::Specification.new do |s|
  s.name        = "dream_cheeky"
  s.version     = DreamCheeky::VERSION
  s.authors     = ["Derrick Spell"]
  s.email       = ["derrick.spell@gmail.com"]
  s.homepage    = ""
  s.summary     = "Ruby Inteface to Dream Cheeky(TM) USB Devices"
  s.description = "Ruby Inteface to Dream Cheeky(TM) USB Devices"

  s.rubyforge_project = "dream_cheeky"

  s.files         = `git ls-files`.split("\n")

  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.extensions    = ['ext/dream_cheeky/extconf.rb']
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_dependency 'pkg-config'
end
