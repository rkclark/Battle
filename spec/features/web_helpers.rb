def sign_in_and_play
  visit "/"
  fill_in "p1_name", :with => "Obama"
  fill_in "p2_name", :with => "Trump"
  click_button("submit_names")
end
