Feature: Allows to look for information 
  about a specific stock

  Scenario: Check if a quote is vlaid 
    When I run `gettick lookup bmo`
    Then the exit status should be 0
    And the stdout should contain:
    """
    bmo  is a valid quote
    """
  Scenario: Check if a quote is vlaid and give -s option 
    When I run `gettick lookup -s bmo`
    Then the exit status should be 0
    And the stdout should contain:
    """
    bmo  is a valid quote market is : NYQ
    """
  Scenario: Check basic info on a quote whith -i
    When I run `gettick lookup -i bmo`
    Then the exit status should be 0
    And the output should match:
    """
    ----------------------------------------------
    symbol : bmo
    ----------------------------------------------
    Ask : .*
    Bid : .*
    AverageDailyVolume : .*
    Currency : USD
    BookValue : .*
    """

