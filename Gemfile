source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

gem 'rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

gem 'active_model_serializers'
gem 'bootstrap-sass'
gem 'dotenv'
gem 'dotenv-rails'
gem 'draper', '> 3.x'
gem 'jbuilder'
gem 'rails-i18n'
gem 'slim-rails'
gem 'sass-rails'

group :development, :test do
  gem 'bullet'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_rewinder'
  gem 'rspec-rails'
  gem 'rspec-json_matcher', require: false
  gem 'rspec_junit_formatter'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
