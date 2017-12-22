source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
gem 'jquery-rails'
gem 'font-awesome-rails' # Font-awesome icon
gem 'ionicons-rails', '~> 2.0'
gem 'jquery-ui-rails'
gem 'ransack', '~> 1.7'
gem 'jquery-turbolinks'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.3'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'fog', '~> 1.38'
gem 'selectize-rails'
gem 'awesome_print', '~> 1.6', '>= 1.6.1'
gem 'simple_form', '~> 3.5'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'bootstrap-will_paginate', '~> 1.0'

gem 'rails-timeago', '~> 2.0'

gem 'bootstrap-datepicker-rails', :require => 'bootstrap-datepicker-rails',
                              :git => 'git://github.com/Nerian/bootstrap-datepicker-rails.git'
gem 'trix', '~> 0.9.0'


gem 'friendly_id', '~> 5.1'

gem 'best_in_place', github: 'bernat/best_in_place'

gem 'impressionist'

gem 'acts_as_votable', '~> 0.10.0'
gem "binding_of_caller" 
gem 'fog-aws'

gem 'acts-as-taggable-on', '~> 4.0'



gem 'figaro'
#gem 'inf', '~> 0.0.9'

gem 'mp3_player'

gem 'summernote-rails', '~> 0.8.1.1'

gem 'country_select', '~> 3.1', '>= 3.1.1'

gem 'phony_rails', '~> 0.14.2'

gem 'mail_form', '~> 1.5', '>= 1.5.1'

gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
#gem 'social-share-button', '~> 0.1.10'

gem 'masonry-rails', '~> 0.2.4'

gem 'acts_as_commentable_with_threading', '~> 2.0', '>= 2.0.1'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
 
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap-sass', '~> 3.3.6'

ruby '2.4.0'
