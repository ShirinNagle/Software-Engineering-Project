Feature: User can manually add an album
#As a user I an add my own albums to the database

    Scenario: Add an album
        Given I am on the Albums home page
        When I follow "Add New Album"
        Then I should be on the Create New Album page
        When I fill in "Artist" with "Band Of Horses"
        And I fill in "Title" with "Cease To Begin"
        And I select "4" from "Rating"
        
        And I press "Save Changes"
        Then I should be on the Albums home page
        And I should see "Band Of Horses"
