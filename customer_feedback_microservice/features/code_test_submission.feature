Feature: The user can submit basic details
  As a user running the application
  I can see some basic information about the company and submit my contact details for a callback
  So that I can request a callback

  Scenario: The user fills all the information correctly
    Given I am on the submission page
    And I had filled the following info
      | name                   | business_name        | telephone_number | email            | notes      | reference      |
      | Sebastian Siemianowski | Blue Light Solutions | 07517419898      | rudph2@gmail.com | some_notes | some_reference |
    When I press submit button
    Then I should see a thank you message

  Scenario: Page is displayed with a basic form to request callback
    When I am on the submission page
    Then I should see basic form for callback request