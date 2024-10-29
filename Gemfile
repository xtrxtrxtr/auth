# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.4'

gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'dotenv-rails', '~> 3.1'
gem 'jbuilder'
gem 'jwt', '~> 2.9'
gem 'kaminari', '~> 1.2'
gem 'rack-cors', '~> 2.0'
gem 'rails-i18n', '~> 7.0'

group :development, :test do
  gem 'database_cleaner'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rspec-rails', '~> 6.1'
  gem 'shoulda-matchers'
end

group :development do
  gem 'rubocop', '~> 1.65'
  gem 'rubocop-factory_bot', '~> 2.26'
  gem 'rubocop-performance', '~> 1.21'
  gem 'rubocop-rails', '~> 2.26'
  gem 'rubocop-rake', '~> 0.6.0'
  gem 'rubocop-rspec', '~> 3.0'
  gem 'rubocop-rspec_rails', '~> 2.30'
end
