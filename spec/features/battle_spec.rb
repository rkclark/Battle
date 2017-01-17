# require 'capybara/rspec'
require 'spec_helper'
# require 'capybara/dsl'
# require './app.rb'
# require 'selenium-webdriver'
# Capybara.app_host = "localhost:9393"
# Capybara.default_driver = :selenium
# Capybara.run_server = false


 describe Battle do
  feature "lets players enter their name" do
    scenario "user fills in name form" do
      visit "/"
      fill_in "p1_name", :with => "Jack"
      fill_in "p2_name", :with => "Rick"
      click_button("start_button")
      expect(page).to have_text("P1 Jack and P2 Rick have entered the game")
    end
  end
 end
