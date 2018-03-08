Feature: The user can submit basic details
  As a user running the application
  I can see some basic information about the company and submit my contact details for a callback
  So that I can request a callback

  Scenario: The user fills all the information correctly
    Given I am on the submission page
    And I had filled the following info
    When I press submit button
    Then I should see a thank you message

  Scenario: Page is displayed with a basic form to request callback
    When I am on the submission page
    Then I should see basic form for callback request