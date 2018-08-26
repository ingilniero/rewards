$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rewards/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rewards"
  s.version     = Rewards::VERSION
  s.authors     = ["Aranza Gargia", "Angel Gallegos", "AGilberto Villa"]
  s.email       = ["aranza@michelada.io", "angel@michelada.io", "gilberto@michelada.io"]
  s.summary     = "Rewards Core"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "5.1.0"

  s.add_development_dependency "sqlite3"
end
