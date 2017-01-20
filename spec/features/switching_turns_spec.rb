feature "switching turns" do
  scenario "after player 1 attacks, player 2 attacks" do
    sign_in_and_play
    click_link('attack_button')
    click_link('attack_button')
    expect("#p2_hp").not_to have_text("60 HP")
  end
  scenario "when game starts, player 1 has active_player class" do
    sign_in_and_play
    player_1_active = page.find("#player_1")[:class].include?("active_player")
    expect(player_1_active).to be true
  end
  scenario "after player 1 attacks, player 2 has active_player class" do
    sign_in_and_play
    click_link('attack_button')
    player_2_active = page.find("#player_2")[:class].include?("active_player")
    expect(player_2_active ).to be true
  end
  scenario "after player 1 attacks, player 1 does not have active_player class" do
    sign_in_and_play
    click_link('attack_button')
    player_1_active = page.find("#player_1")[:class].include?("active_player")
    expect(player_1_active ).to be false
  end
  scenario "after player 2 attacks, player 1 has active_player class" do
    sign_in_and_play
    click_link('attack_button')
    click_link('attack_button')
    player_1_active = page.find("#player_1")[:class].include?("active_player")
    expect(player_1_active).to be true
  end
  scenario "after player 2 attacks, player 2 does not have active_player class" do
    sign_in_and_play
    click_link('attack_button')
    click_link('attack_button')
    player_2_active = page.find("#player_2")[:class].include?("active_player")
    expect(player_2_active ).to be false
  end
end
