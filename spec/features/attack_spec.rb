feature "attack" do
  scenario "p1 can attack p2" do
    sign_in_and_play
    click_link('attack_button')
    expect(page).to have_content("Obama attacked Trump")
  end
  scenario "p1 can attack p2" do
    sign_in_and_play
    click_link('attack_button')
    expect("#p2_hp").not_to have_text("60 HP")
  end
  scenario "can click on buttons to Attack, Paralyse, Sleep, Poison and Heal" do
    sign_in_and_play
    expect(page.find("a#paralyse-button")).not_to be_falsey
    expect(page.find("a#sleep-button")).not_to be_falsey
    expect(page.find("a#poison-button")).not_to be_falsey
    expect(page.find("a#heal-button")).not_to be_falsey
  end
end
