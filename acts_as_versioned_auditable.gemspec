# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "acts_as_versioned_auditable"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["JOBFutures Developers"]
  s.email       = ["developers@jobfutures.com"]
  s.homepage    = "https://github.com/jobfutures/acts_as_versioned_auditable"
  s.summary     = "Adds an auditable column to acts as versioned"
  s.description = "This requires acts_as_versioned and simply adds an auditable type to the model."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "acts_as_versioned"
  s.add_dependency "activerecord", "~> 2.3"

  s.files        = Dir.glob("lib/**/*") + %w(Gemfile init.rb acts_as_versioned_auditable.gemspec rails/init.rb)
  s.require_path = 'lib'
end
