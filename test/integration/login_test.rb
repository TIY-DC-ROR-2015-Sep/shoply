require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "users can log in" do
    User.create! email: "james@example.com", password: "password"

    visit "/users/sign_in"

    fill_in "Email", with: "james@example.com"
    fill_in "Password", with: "password"
    click_on "Log in"

    assert_includes find(:css, ".alert").text, "Signed in successfully"
  end
end
