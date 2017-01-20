def sign_in_and_play
  visit "/"
  fill_in "p1_name", :with => "Obama"
  fill_in "p2_name", :with => "Trump"
  click_button("submit_names")
end

def sign_in_and_play_one_player
  visit "/"
  fill_in "p1_name", :with => "Obama"
  click_button("submit_names")
end

def click_until_game_over
  while page.has_no_content?("reaches 0 HP") do
    click_link('attack_button')
  end
end
