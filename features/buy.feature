
Feature: Allows to buy new stock in the portfolio

  Scenario: I buy a new quote in the portfolio
    When I run `gettick -r buy bmo 4`
    Then the exit status should be 0
    And the file ".portfolio" should match /"bmo":4/

