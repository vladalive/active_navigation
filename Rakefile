require "rubygems"
require 'rake'
require "rake/gempackagetask"
require "rake/rdoctask"

require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end


desc 'Default: run unit tests.'
task :default => ["test"]

# This builds the actual gem. For details of what all these options
# mean, and other ones you can add, check the documentation here:
#
#   http://rubygems.org/read/chapter/20
#
spec = Gem::Specification.new do |s|

  # Change these as appropriate
  s.name              = "active_navigation"
  s.version           = "0.1.1"
  s.summary           = "Active Navigation is Rails plugin that helps building navigation menus"
  s.author            = "Vlad Alive"
  s.email             = "vladalive@gmail.com"
  s.homepage          = "http://github.com/vladalive/active_navigation"

  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.rdoc)
  s.rdoc_options      = %w(--main README.rdoc)
  s.platform          = Gem::Platform::RUBY

  PKG_FILES = FileList[
    '[a-zA-Z]*',
    'generators/**/*',
    'lib/**/*',
    'app/**/*',
    'rails/**/*',
    'tasks/**/*',
    'test/**/*'
  ]

  # Add any extra files to include in the gem
  # s.files             = %w(README.rdoc init.rb uninstall.rb MIT-LICENSE Rakefile install.rb) + Dir.glob("{test,lib/**/*}")
  s.files             = PKG_FILES.to_a
  s.require_paths     = ["lib"]

  # If you want to depend on other gems, add them here, along with any
  # relevant versions
  # s.add_dependency("some_other_gem", "~> 0.1.0")
  s.add_dependency("haml", "~> 3.0.0")

  # If your tests use any gems, include them here
  # s.add_development_dependency("mocha") # for example
end

# This task actually builds the gem. We also regenerate a static
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
#
# To publish your gem online, install the 'gemcutter' gem; Read more 
# about that here: http://gemcutter.org/pages/gem_docs
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

task :package => :gemspec

# Generate documentation
Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end

