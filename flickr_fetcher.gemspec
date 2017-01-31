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

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = 'flickr_search'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_runtime_dependency 'flickraw', '~> 0.9.9'
  spec.add_runtime_dependency 'httparty', '~> 0.14.0'
  spec.add_runtime_dependency 'mini_magick', '~> 4.6'
end
