source "https://rubygems.org"

gem "rails", "~> 8.1.3"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "bootsnap", require: false

# Pipeline & Assets
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sprockets-rails"
gem "sassc-rails"
gem "bootstrap", "~> 5.3"
gem "autoprefixer-rails"
gem "font-awesome-sass", "~> 6.1"
gem "simple_form", github: "heartcombo/simple_form"

# IA & Stockage
gem "ruby_llm", "~> 1.15"
gem "cloudinary"
gem "image_processing", "~> 1.2"
gem "kramdown"
gem "rouge"
gem "kramdown-parser-gfm"

# Rails 8 Infrastructure (Solid stack)
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "jbuilder"
gem "devise"

# Déploiement & Outils système
gem "kamal", require: false
gem "thruster", require: false
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "dotenv-rails"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  # Outils essentiels pour debugger l'IA et les outils
  # gem "httplog"
  gem "pry-byebug"
  gem "pry-rails"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
