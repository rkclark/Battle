require 'spec_helper'

 describe Battle do
  feature "lets players enter their name" do
    scenario "user fills in name form" do
      visit "/"
      fill_in "p1_name", :with => "Jack"
      fill_in "p2_name", :with => "Rick"
      click_button("submit_names")
      expect(page).to have_text("P1 Jack and P2 Rick have entered the game")
    end
  end
 end
