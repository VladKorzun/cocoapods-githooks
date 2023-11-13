# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-githooks'
  spec.version       = File.read(File.expand_path('VERSION', __dir__))
  spec.authors       = ['Vlad Korzun']
  spec.email         = ['vladyslavkorzun@gmail.com']
  spec.summary       = 'A CocoaPods plugin that syncs git hooks between team members'
  spec.homepage      = 'https://github.com/VladKorzun/cocoapods-githooks'
  spec.license       = 'MIT'
  spec.files         = Dir['lib/**/*']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.3'

  spec.required_ruby_version = '>= 2.7'
end
