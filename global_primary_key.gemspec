$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "global_primary_key"
  s.version     = "0.0.1"
  s.authors     = ["Jimmy Huang"]
  s.email       = ["jimmy.huangjin@gmail.com"]
  s.homepage    = "http://jimhj.github.com"
  s.summary     = "Global Primary Key."
  s.description = "Generate global primary key like '0101-04687fc9b0-9995' for active record."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.12"

end
