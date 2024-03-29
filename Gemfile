source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use pg as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SASS for stylesheets
gem 'sass-rails', '~> 5.0'
gem "autoprefixer-rails"
gem 'bourbon'
gem 'neat'
gem 'bitters'
gem 'refills'
gem 'font-awesome-sass', '~> 4.7.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.
# gem 'simple_form'
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# A Rails engine that helps you put together a super-flexible admin dashboard.
gem 'administrate'
# Easy file attachment management for ActiveRecord
gem 'paperclip'
# Template language whose goal is reduce the syntax to the essential parts without becoming cryptic.
gem 'slim'
# Ckeditor integration gem for rails http://ckeditor.com/
gem 'ckeditor'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Testing framework
  gem 'minitest-spec-rails'
  # A library for setting up Ruby objects as test data
  gem 'factory_girl_rails'
  # Create temporary table-backed ActiveRecord models for use in tests
  gem 'temping'
  # Debugging tool
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # An IRB alternative and runtime developer console
  gem 'pry'
  # A Ruby static code analyzer, based on the community Ruby style guide. http://rubocop.readthedocs.io
  gem 'rubocop', '~> 0.46.0', require: false
  # Annotate Rails classes with schema and routes info
  gem 'annotate'
  # Generate Entity-Relationship Diagrams for Rails applications http://voormedia.github.io/rails-erd/
  gem 'rails-erd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
