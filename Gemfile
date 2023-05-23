# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development, :test do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

# for UI purposes
gem 'bootstrap', '~> 5.3.0.alpha3'
gem 'haml-rails', '~> 2.0'
gem 'html2haml', '~> 2.2', '>= 2.2.1'
gem 'jquery-rails'
gem 'simple_form'
gem 'webpacker', '~> 5.0'

# for authentication
gem 'devise'

# for mailer purposes in development
gem 'letter_opener', group: :development

# for attachments
gem 'carrierwave', '>= 3.0.0.beta', '< 4.0'
gem 'fog-aws'

# for code quality and style
gem 'rubocop-rails', require: false

# for pagination
gem 'pagy', '~> 6.0', '>= 6.0.3'

# for admin panel
gem 'activeadmin', '~> 2.13'

gem 'bcrypt', '~> 3.1'
gem 'cssbundling-rails', '~> 1.1'
gem 'jsbundling-rails', '~> 1.1'

# for authorization
gem 'cancancan'

# for testing
group :development, :test do
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'factory_bot_rails', '~> 5.1'
  gem 'capybara', '~> 3.29'
  gem 'faker'
  gem 'byebug'
  gem 'rails-controller-testing'
end

group :test do
  gem 'database_cleaner', '~> 1.7'
end

