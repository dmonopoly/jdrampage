Feature: Users have basic abilities

    In order to manage site content
    As a user
    I have basic abilities

    Scenario: A user who logs in should see the back home page
        Given I am on the home page
        And I am the registered poster John Doe
        When I log in
        Then I should see the back home page

    @wip
    Scenario: A user who logs in should have article controls
        Given I am on the home page
        When I log in
        Then I should see article controls

    @wip
    Scenario: A user who logs in should have user controls
        Given I am on the home page
        When I log in
        Then I should see user controls

