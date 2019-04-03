source 'https://rubygems.org'

# suggestion from:
#   https://github.com/bundler/bundler/blob/
#      3e3f64f1166c4613329495459793dbd5a714efd3/lib/bundler/dsl.rb#L254
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0'
gem 'sass-rails'
gem 'uglifier'
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
gem 'responders'

gem 'marc'
gem 'rack-conneg'
gem 'sinatra'
gem 'multi_json'
gem 'oj'
gem 'gyoku'
gem 'rubyzip'

group :development do
  gem 'spring'
  gem 'capistrano-rails'

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
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'byebug'
  gem 'pry'
  gem 'rerun'

  # CUL - localhost development uses sqlite
  gem 'sqlite3'
  gem 'webmock'
  gem 'rails-controller-testing'
end

gem 'locations', github: "pulibrary/locations", tag: 'v1.2.0'

gem 'yaml_db'
gem 'friendly_id'

# gem 'devise', '~> 4.2'
# gem 'omniauth-cas'
# Columbia Authentication
# gem 'devise', '~> 3.0'
# gem 'cul_omniauth'
# gem 'cul_omniauth', github: "cul/cul_omniauth", branch: 'rails-5'
# gem 'cul_omniauth', path: '/Users/marquis/src/cul_omniauth'
gem 'cul_omniauth', github: "cul/cul_omniauth", branch: 'cas-5.3'
gem 'devise'

# Columbia fetches user details from ldap
gem 'net-ldap'


gem 'capybara'
gem 'poltergeist'
gem 'resque'

gem 'traject'
gem 'stringex', github: "pulibrary/stringex", tag: 'vpton.2.5.2.2'
gem 'library_stdnums'
gem 'faraday'
gem 'iso-639'
gem 'newrelic_rpm'
