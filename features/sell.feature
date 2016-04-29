Feature: Allows to sell stock in the portfolio

  Scenario: I buy a new quote in the portfolio
    Given a file named ".portfolio" with:
    """
    {"account":10000, "title":{"bmo":6}}
    """
    When I run `gettick  sell bmo 4`
    Then the file ".portfolio" should match /"bmo":2/
