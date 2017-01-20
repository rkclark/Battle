feature "Computerised Opponent" do
  scenario "Auto-attacks on its turn" do
    sign_in_and_play_one_player
    click_link('attack_button')
    expect("#p2_hp").not_to have_text("60 HP")
    expect("#p1_hp").not_to have_text("60 HP")
  end
  
end
