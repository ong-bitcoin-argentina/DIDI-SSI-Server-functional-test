@didi-server
Feature: Admin Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Obtains confidential information about the user according to their phone number.
    Given A account <request>
    When I send POST request to /admin/user/phone
    Then I get response code 200

    Examples:
      | request                 |
      | { "phone": "40762726" } |


  Scenario Outline: Get confidential information about the user according to his did.
    Given A account
    When I send GET request to /admin/user/did/: <did>
    Then I get response code 200

    Examples:
      |                           did                          |
      |  did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc   |