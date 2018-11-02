source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "bootstrap-sass"
gem "coffee-rails", "~> 4.2"
gem "font-awesome-rails", "~> 4.7", ">= 4.7.0.2"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "react-rails"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "puma", "~> 3.7"
gem "uglifier", ">= 1.3.0"


source "https://rails-assets.org/" do
  gem "rails-assets-adminlte"
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "mysql2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
