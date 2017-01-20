feature "hitpoints" do
  scenario "can see player 1 hitpoints" do
    sign_in_and_play
    expect(page).to have_selector("#p1_hp", text: "60 HP")
  end
  scenario "can see player 2 hitpoints" do
    sign_in_and_play
    expect(page).to have_selector("#p2_hp", text: "60 HP")
  end
  scenario "can see game over message when player HP reaches 0" do
    sign_in_and_play
    click_until_game_over
    expect(page).to have_content("reaches 0 HP!")
    expect(page).to have_content("wins!")
  end
end
