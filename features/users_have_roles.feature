Feature: Users have roles

    In order to protect application data
    As a user
    I have limited abilities based on my role

    @wip
    Scenario: admin cannot modify superadmin
        Given my role is 'admin'
        When I am on the users page
        Then I should see "All Users"
        Then I should not see 'superadmin' within the user role column

