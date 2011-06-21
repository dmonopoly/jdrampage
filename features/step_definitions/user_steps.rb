# abandoned
Given /^I am the registered (.+) "(.+)"$/ do |role, login|
  @user = User.create!(
    :login => login,
    :password => "some_password",
    :password_confirmation => "some_password",
    :role => role,
    :email => "some_email@somewhere.com"
  )
end

# abandoned
When /^I log in$/ do
  click_link "Login" # problem... javascript:void(0)
  fill_in "login", :with => @user.login
  fill_in "password", :with => @user.password
  click_button "Login"
end

Given /^I am the logged in (.+) "([^"]*)"$/ do |role, login|
  user = User.create!(
    :login => login,
    :password => "password",
    :password_confirmation => "password",
    :role => role,
    :email => "some_email@somewhere.com"
  ).confirm!
  UserSession.create(user)
end

