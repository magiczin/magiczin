source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.0"

gem "rails", "~> 5.1.4"

gem "pg", "~> 0.18"

gem "mtg_sdk", "~> 3.2"

gem "kaminari", "~> 1.1"
gem "pg_search", "~> 2.1"
gem "searchlight", "~> 4.1"

gem "chartkick"

gem "bootsnap", "~> 1", require: false

gem "jbuilder", "~> 2.5"
gem "omniauth-google-oauth2", "~> 0.5.3"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "scout_apm", "~> 2.4"
gem "semantic-ui-sass"
gem "sidekiq", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "webpacker", "~> 3.0"

gem "draper", "~> 3.0"

group :development, :test do
  gem "awesome_print"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails"
  gem "pry-byebug"
  gem "pry-rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
  gem "xray-rails", "~> 0.3.1"
end
