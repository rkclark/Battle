feature "lets players enter their name" do
  scenario "user fills in name form" do
    sign_in_and_play
    expect(page).to have_text("Obama")
    expect(page).to have_text("Trump")
  end
end
