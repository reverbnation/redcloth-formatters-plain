# -*- mode: ruby; encoding: utf-8; -*-

require "rspec/core/rake_task"

namespace "bundler" do
  require "bundler/gem_tasks"
end

# A subclass of Bundler::GemHelper that allows us to push to Gemfury
# instead of rubygems.org.
class GemfuryGemHelper < Bundler::GemHelper
  def release_gem(built_gem_path=nil)
    guard_clean
    built_gem_path ||= build_gem
    tag_version { git_push } unless already_tagged?
    gemfury_push(built_gem_path) if gem_push?
  end

  protected

  def gemfury_push(path)
    sh("fury push --as=reverbnation '#{path}'")
    Bundler.ui.confirm "Pushed #{name} #{version} to gemfury.com."
  end
end

RSpec::Core::RakeTask.new("spec").tap do |config|
  config.rspec_opts = "--color"
end
spec = Bundler::GemHelper.gemspec

task :default => :spec

desc "Build #{spec.name}-#{spec.version}.gem into the pkg directory."
task :build => "bundler:build"

desc "Create tag v#{spec.version} and build and push #{spec.name}-#{spec.version}.gem to Gemfury"
task :release => "bundler:build" do
  GemfuryGemHelper.new.release_gem
end
