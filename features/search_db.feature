Feature: User can add an album by searching in the Hotpress Album DB

As a music lover 
So that I can search if an album title already exists in the database
I want to add albums by looking up the artist details in the Albums DB

Background: 
  Given I am on the Albums home page
Scenario: Try to find a non existant album(sad path)
  
  Then I should see "SearchDB"
  When I fill in "Search DB" with "Ola"
  And I press "SearchDB"
  Then I should be on the Albums home page
  And I should see "Ola" was not found in Database
  
Scenario: Try to find an existing album(happy path)
 
  Then I should see "SearchDB"
  When I fill in "Search DB" with "13"
  And I press "SearchDB"
  Then I should be on the show Albums page
  And I should see "13" was found in Database