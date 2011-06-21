@require_login
Feature: Users have roles

    In order to protect application data
    As a user
    I have limited abilities based on my role

    Scenario: admin cannot modify superadmin
        Given I am the logged in admin "Trinity Mathis"
        When I am on the users page
        Then I should see "All Users"
        Then I should not see "superadmin" within the user role column

