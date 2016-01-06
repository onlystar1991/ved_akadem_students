source 'https://rubygems.org'

gem 'rails', '4.2.1'

gem 'haml'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'pg'
gem 'responders', '~> 2.0'

gem 'kaminari'

gem 'devise'
gem 'pundit'
gem 'recaptcha', require: 'recaptcha/rails'

gem 'simple_form', '3.1.0', github: 'plataformatec/simple_form'
gem 'nested_form'

gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick'
gem 'jcrop-rails-v2'

gem 'axlsx'
gem 'prawn-rails'

gem 'jquery-ui-rails'
gem 'bootstrap-sass'
gem 'intl-tel-input-rails', '3.6.0.1'

gem 'momentjs-rails', '>= 2.8.1'
gem 'bootstrap3-datetimepicker-rails', '~> 4.0.0'

gem 'react-rails', '~> 1.0'

gem 'sidekiq'

gem 'airbrake'

gem 'paper_trail', '~> 4.0.0.rc'

group :production, :development do
  gem 'puma'
  gem 'whenever', require: false
  gem 'newrelic_rpm'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-puma', require: false
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'erd'
  gem 'letter_opener'
  gem 'haml-rails'
  gem 'web-console', '~> 2.0'
  gem 'meta_request'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-given'
  gem 'fuubar'
  gem 'poltergeist'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'rack_session_access'
end
