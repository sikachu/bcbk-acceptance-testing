RSpec.feature "User authentication", type: :feature do
  scenario "Sign in with valid username and password" do
    visit homepage_path

    fill_in "Username", with: "apple-fanboy"
    fill_in "Password", with: ENV["BLOGNONE_PASSWORD"]
    click_button "Log in"

    expect(page).to have_content("My account")
  end

  scenario "Sign in with invalid username and password" do
    visit homepage_path

    fill_in "Username", with: "apple-fanboy"
    fill_in "Password", with: "nope"
    click_button "Log in"

    expect(page).to have_content("Sorry, unrecognized username or password.")
  end

  def homepage_path
    "https://www.blognone.com"
  end
end
