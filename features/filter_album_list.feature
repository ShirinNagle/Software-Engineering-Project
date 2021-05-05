Feature: Display list of albums filtered by user rating

Background: albums have been added to database


Given that the following albums exist:
| artist         | title             | rating | release_date|  
|Gorillaz        |Humanz             |3       | 2017-Apr-27 |
|Gorillaz        |Plastic Beach      |4       | 2010-Mar-03 |
|Sinead O'Connor |Lion and the Cobra |5       | 1987-Nov-04 |

And I am on the Albums home page
Then 3 seed albums should exist

Scenario: restrict to albums with '4' or '3'
  Given I check the following ratings: 4, 3
  And I uncheck the following ratings: 5
  When I press "Refresh"
  Then I should see "Humanz"
  #enter steps to ensure other albums are not visible
Scenario: all ratings selected