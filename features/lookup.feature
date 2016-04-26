Feature: Allows to look for information 
  about a specific stock

  Scenario: Check if a quote is vlaid 
    When I run `gettick lookup bmo`
    Then the exit status should be 0
    And the stdout should contain exactly:
    """
    bmo  is a valid quote
    """
  Scenario: Check if a quote is vlaid and give -s option 
    When I run `gettick lookup -s bmo`
    Then the exit status should be 0
    And the stdout should contain exactly:
    """
    bmo  is a valid quote market is : NYQ
    """
  Scenario: Check basic info on a quote whith -i
    When I run `gettick lookup -i bmo`
    Then the exit status should be 0
    And the stdout should contain exactly:
    """
    ----------------------------------------------
    symbol : bmo
    ----------------------------------------------
    Ask : 65.26
    Bid : 65.24
    AverageDailyVolume : 706167
    Currency : USD
    BookValue : 46.83
    """

