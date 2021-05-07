Feature: User can add an album by searching in the Hotpress Album DB

As a music lover 
So that I can add new albums from an artist without manually inputting details
I want to add albums by looking up the artist details in the Hotpress Album DB

Background: 
  Given I am on the Albums home page
Scenario: Try to add non existant album(sad path)
  
  Then I should see "SearchDB"
  When I fill in "Search DB" with "Ola"
  And I press "SearchDB"
  Then I should be on the Albums home page
  And I should see "Ola" was not found in Database
  
Scenario: Try to add a real album(happy path)
 
  Then I should see "SearchDB"
  When I fill in "Search DB" with "Blur"
  And I press "SearchDB"
  Then I should be on the Albums home page
  And I should see "Ola" was not found in Database