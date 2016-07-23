require 'rails_helper'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.app_host = 'http://ruby-project-yershovkiril.c9users.io:8080/'
Capybara.javascript_driver = :poltergeist

# Capybara.javascript_driver = :webkit