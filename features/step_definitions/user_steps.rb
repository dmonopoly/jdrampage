Given /^I am the registered "([^"]*) "([^"]*)"$/ do |role, login|
  pending
  params = {
    :login => login,
    :password => "some_password",
    :password_confirmation => "some_password"
  }
end

When /^I log in$/ do
  pending
  click_link "Login"
  fill_in
end

