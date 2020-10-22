# -*- encoding: utf-8 -*-
Gem::Specification.new do |spec|
  spec.name = 'player_email_address_component'
  spec.version = '0.0.0'
  spec.summary = 'Player Email Address Component'
  spec.description = ' '

  spec.authors = ['Joseph Choe']
  spec.email = ['joseph@josephchoe.com']
  spec.homepage = 'https://github.com/dragonwright/player-email-address-component'

  spec.require_paths = ['lib']
  spec.files = Dir.glob('{lib}/**/*')
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.6'

  spec.add_runtime_dependency 'eventide-postgres'
  spec.add_runtime_dependency 'evt-try'

  spec.add_development_dependency 'test_bench'

  spec.add_development_dependency 'evt-entity_projection-fixtures'
  spec.add_development_dependency 'evt-messaging-fixtures'
end
