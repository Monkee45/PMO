Gem::Specification.new do |s|
  s.name         = "PMO_mw"
  s.version      = "1.0.0"
  s.author       = "Michael Walsh"
  s.email        = "michael.tom.walsh@gmail.com"
  s.homepage     = "https://au.linkedin.com/in/Monkee45"
  s.summary      = "basic project and team members with random rating system"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'PMO' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 0'
end
