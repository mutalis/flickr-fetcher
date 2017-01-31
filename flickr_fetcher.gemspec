# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flickr_fetcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'flickr_fetcher'
  spec.version       = FlickrFetcher::VERSION
  spec.licenses      = ['GPL-3.0']
  spec.authors       = ['rasg']
  spec.email         = ['rasg@example.com']

  spec.summary       = %q{Flickr fetcher ruby command line application}
  spec.description   = %q{Fetchs Flickr images using a list of search keywords as arguments.}
  spec.homepage      = 'https://github.com/mutalis/flickr-fetcher'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
