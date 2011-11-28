# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "warpaint/version"

Gem::Specification.new do |s|
  s.name        = "warpaint"
  s.version     = Warpaint::VERSION
  s.authors     = ["Robert Boyd"]
  s.email       = ["robert.boyd@me.com"]
  s.homepage    = "http://github.com/rboyd"
  s.summary     = "Kismet + phone GPS = wardrive maps"
  s.description = "Warpaint is a library and command-line utility for integrating GPS Exchange Format (GPX) files with Kismet logs (NetXML) to produce Google Earth (KML) output."

  s.rubyforge_project = "warpaint"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"

  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "builder"
  s.add_runtime_dependency "schleyfox-ruby_kml"
  s.add_runtime_dependency "kamel"
  s.add_runtime_dependency "mixlib-cli"
  s.add_runtime_dependency "rbtree"
end