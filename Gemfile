source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'active_model_serializers', '~> 0.10.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1'
gem 'virtus'

group :development, :test do
  gem 'byebug', platforms: %i[mri]
  gem 'rspec-its'
  gem 'rspec-rails'
end

group :development do
  gem 'activerecord-import'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pronto', '~> 0.9.5', require: false
  gem 'pronto-brakeman', require: false
  gem 'pronto-rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers'
end
