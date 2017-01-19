feature "hitpoints" do
  scenario "can see player 1 hitpoints" do
    sign_in_and_play
    expect(page).to have_selector("#p1_hp", text: "100 HP")
  end
  scenario "can see player 2 hitpoints" do
    sign_in_and_play
    expect(page).to have_selector("#p2_hp", text: "100 HP")
  end
  scenario "can see game over message when player HP reaches 0" do
    sign_in_and_play
    19.times { click_attack }
    save_and_open_page
    expect(page).to have_selector("#p2_hp", text: "0 HP")
    expect(page).to have_content("Trump reaches 0 HP!")
    expect(page).to have_content("Obama wins!")
  end
end

def click_attack
  click_link('attack_button')
end
