source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'

gem 'devise' # User Authentication
gem 'thin' # Use Thin as Server
gem 'tzinfo-data', platforms: [:mingw, :mswin] # Rails Core Windows Dependency, Provides Time Zone Info
#tools
gem 'active_model_serializers'
gem 'awesome_print'
gem 'browser'
gem 'decent_exposure', :git => 'git://github.com/voxdolo/decent_exposure.git'
gem 'fog', "~> 1.3.1"
gem 'i18n-tasks', '~> 0.2.10'
gem 'json'
gem 'phony_rails' # validates phones
gem 'time_diff'

group :development, :test do
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
  gem 'capybara'
  gem 'cucumber-rails', :require => false, git: 'https://github.com/cucumber/cucumber-rails.git'
  gem 'database_cleaner'
  # gem 'debugger' ,'~> 1.6.5'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'foreman'
  gem 'launchy'
  gem 'letter_opener'
  gem 'populator'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 2.0'
  gem 'selenium-webdriver'
  gem 'watir-webdriver'
end

group :development do
  gem 'sqlite3' # SQLite3 DB
  gem 'better_errors' # Better Errors
  gem 'binding_of_caller' # Better Debugging
  gem 'gem-open'
  gem 'railroady'
end

group :production do
  gem 'pg' # Postgresql DB
  gem 'rails_12factor' # Heroku asset handler
end

## Views and Assets
####################

gem 'sass-rails', '~> 4.0.0' # Use SCSS for stylesheets
gem 'bootstrap-sass' # Pull our selves up by our Bootstraps
# gem 'slim-rails' # Lose some weight
gem 'haml' # Ham it up


# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails' # jQuery
gem 'turbolinks' # AJAXED Page Gets
gem 'jbuilder', '~> 1.2'# JSON APIs with ease

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
