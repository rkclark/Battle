feature "switching turns" do
  scenario "after player 1 attacks, player 2 attacks" do
    sign_in_and_play
    click_link('attack_button')
    click_link('attack_button')
    expect(page).to have_selector("#p1_hp", text: "90 HP")
    expect(page).to have_selector("#p2_hp", text: "90 HP")
  end
  scenario "when game starts, player 1 has active_player class" do
    sign_in_and_play
    expect(page).to have_selector("#player_1", class: "active_player")
  end
  scenario "after player 1 attacks, player 2 has active_player class" do
    sign_in_and_play
    click_link('attack_button')
    expect(page).to have_selector("#player_2", class: "active_player")
    expect(page).not_to have_selector("#player_1", class: "active_player")
  end
  scenario "after player 2 attacks, player 1 has active_player class" do
    sign_in_and_play
    click_link('attack_button')
    click_link('attack_button')
    expect(page).to have_selector("#player_1", class: "active_player")
    expect(page).not_to have_selector("#player_2", class: "active_player")
  end
end
