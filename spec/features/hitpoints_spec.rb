feature "hitpoints" do
  scenario "can see player 1 hitpoints" do
    sign_in_and_play
    expect(page).to have_selector("p#p1_hp", text: "HP")
  end
  scenario "can see player 2 hitpoints" do
    sign_in_and_play
    expect(page).to have_selector("p#p2_hp", text: "HP")
  end
end
