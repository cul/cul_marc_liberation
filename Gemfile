source 'https://rubygems.org'

# suggestion from:
#   https://github.com/bundler/bundler/blob/
#      3e3f64f1166c4613329495459793dbd5a714efd3/lib/bundler/dsl.rb#L254
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'mysql2'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'high_voltage', '~> 3.0'
gem 'loops', github: 'kovyrin/loops', branch: 'master'
gem 'stomp'

group :development, :production do
  gem 'ruby-oci8', '~> 2.2.1'
end

# CUL local version?
# gem 'voyager_helpers', path: '/Users/marquis/src/voyager_helpers'

# gem 'voyager_helpers', github: "pulibrary/voyager_helpers", tag: 'v0.4.4'
gem 'voyager_helpers', github: "pulibrary/voyager_helpers", tag: 'v0.5.0'
gem 'responders', '~> 2.3'

gem 'marc', '~> 1.0'
gem 'rack-conneg', '~> 0.1.5'
gem 'sinatra', '~> 2.0'
gem 'multi_json', '~> 1.10.1'
gem 'oj'
gem 'gyoku', '~> 1.0'
gem 'rubyzip', '>= 1.0.0'

group :development do
  gem 'spring'
  gem 'capistrano-rails', '~> 1.1.1'

  # CUL
  # "idiomatic support for your preferred ruby version manager"
  gem 'capistrano-rvm'
  # The `deploy:restart` hook for passenger applications is now in a separate gem
  # Just add it to your Gemfile and require it in your Capfile.
  gem 'capistrano-passenger'
  
  # CUL
  # repl in browser on errors
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  # bundler and rake come in from the voyager_helpers gemspec
  gem 'rspec-rails', '~> 3.5'
  gem 'simplecov'
  gem 'byebug', '~> 3.5.1'
  gem 'pry'
  gem 'rerun', '~> 0.10.0'

  # CUL - localhost development uses sqlite
  gem 'sqlite3'
  gem 'webmock'
  gem 'rails-controller-testing'
end

gem 'locations', github: "pulibrary/locations", tag: 'v1.0.0'
gem 'yaml_db', '~> 0.6.0'
gem 'friendly_id', '~> 5.1.0'

# gem 'devise', '~> 4.2'
# gem 'omniauth-cas'
# Columbia Authentication
# gem 'devise', '~> 3.0'
# gem 'cul_omniauth'
gem 'cul_omniauth', github: "cul/cul_omniauth", branch: 'rails-5'
gem 'devise'

# Columbia fetches user details from ldap
gem 'net-ldap'


gem 'capybara'
gem 'poltergeist'
gem 'resque'

gem 'traject', '2.3.1'
gem 'stringex', github: "pulibrary/stringex", tag: 'vpton.2.5.2.2'
gem 'library_stdnums'
gem 'faraday'
gem 'iso-639'
gem 'newrelic_rpm'
