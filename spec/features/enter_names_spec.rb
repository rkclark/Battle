feature "lets players enter their name" do
  scenario "can fill in names form" do
    sign_in_and_play
    expect(page).to have_text("Obama")
    expect(page).to have_text("Trump")
  end
  scenario "player 2 is named Computer if left blank" do
    sign_in_and_play_one_player
    expect(page).to have_text("Computer")
  end
end
