# -*- mode: ruby; encoding: utf-8; -*-

$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rn_red_cloth_formatters_plain"
  s.version     = "2.2.0"
  s.authors     = ["Joseph Halter", "Jeff Zellman", "Andrew Watts"]
  s.email       = ["joseph@openhood.com", "jzellman@gmail.com", "ahwatts@gmail.com"]
  s.homepage    = "https://github.com/reverbnation/redcloth-formatters-plain"
  s.summary     = "Redcloth Plain Text Formatter (ReverbNation's version)"
  s.description = "Allows Redcloth to output plain text"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "gemfury"
  s.add_development_dependency "rspec", "~> 2"
  s.add_development_dependency "rake"
  s.add_dependency "RedCloth", ">= 4.2.3"
end
