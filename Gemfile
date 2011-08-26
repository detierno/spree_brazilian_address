source 'http://rubygems.org'

# temporarily needed until next capybara release
gem 'selenium-webdriver', '0.2.1'

group :test do
  gem 'factory_girl', '= 1.3.3'
  gem 'factory_girl_rails', '= 1.0.1'
  gem 'rcov'
  gem 'shoulda'
  gem 'faker'
  gem 'guard-rspec'
  if RUBY_VERSION < "1.9"
    gem "ruby-debug"
  else
    gem "ruby-debug19"
  end
end

group :test, :development do
  gem "rspec-rails"
end

group :cucumber do
  gem 'cucumber-rails'
  gem 'database_cleaner', '= 0.6.7'
  gem 'nokogiri', '1.4.4'
  gem 'capybara', '= 1.0.0'
  gem 'factory_girl', '= 1.3.3'
  gem 'factory_girl_rails', '= 1.0.1'
  gem 'growl'
  gem 'faker'
  gem 'launchy'

  if RUBY_VERSION < "1.9"
    gem "ruby-debug"
  else
    gem "ruby-debug19"
  end
end
gem 'spree_core', :path => '/Users/denisantoniazzi/Sites/gems/spree_brazilian_address/../spree/core'
gem 'spree_brazilian_address', :path => '/Users/denisantoniazzi/Sites/gems/spree_brazilian_address'
gem 'sqlite3-ruby'