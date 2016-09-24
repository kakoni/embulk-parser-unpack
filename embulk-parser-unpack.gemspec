
Gem::Specification.new do |spec|
  spec.name          = "embulk-parser-unpack"
  spec.version       = "0.1.0"
  spec.authors       = ["Karri Niemel\u{e4}"]
  spec.summary       = "Unpack parser plugin for Embulk"
  spec.description   = "Parses fixed width files read by other file input plugins."
  spec.email         = ["kakoni@gmail.com"]
  spec.licenses      = ["MIT"]
  spec.homepage      = "https://github.com/kakoni/embulk-parser-unpack"

  spec.files         = `git ls-files`.split("\n") + Dir["classpath/*.jar"]
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'embulk', ['>= 0.8.9']
  spec.add_development_dependency 'bundler', ['>= 1.10.6']
  spec.add_development_dependency 'rake', ['>= 10.0']
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'test-unit-rr'
end
