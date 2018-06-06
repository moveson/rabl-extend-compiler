
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rabl/extend/compiler/version"

Gem::Specification.new do |spec|
  spec.name          = "rabl-extend-compiler"
  spec.version       = Rabl::Extend::Compiler::VERSION
  spec.authors       = ["Brandon Dewitt"]
  spec.email         = ["brandonsdewitt+rubygems@gmail.com"]

  spec.summary       = %q{ a set of rake tasks to compile rabl templates for performance }
  spec.description   = %q{ a set of rake tasks to compile and verify rabl templates that use `extend` for moooooaaar performance }
  spec.homepage      = "https://github.com/abrandoned/rabl-extend-compiler"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
