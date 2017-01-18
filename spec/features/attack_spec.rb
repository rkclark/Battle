feature "attack" do
  scenario "p1 can attack p2" do
    sign_in_and_play
    click_link('attack_button')
    expect(page).to have_content("Obama attacked Trump")
  end
  scenario "p1 can attack p2" do
    sign_in_and_play
    click_link('attack_button')
    expect(page).to have_selector("#p2_hp", text: "90 HP")
  end
end
