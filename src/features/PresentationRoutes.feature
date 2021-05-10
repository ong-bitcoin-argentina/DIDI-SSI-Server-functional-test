@didi-server
Feature: Presentation Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Get a presentation given an id
    Given A account
    When I send GET request to /presentation/: <id>
    Then I get response code 200

    Examples:
      | id        |
      | 321321312 |

  Scenario Outline: Save a presentation
    Given A token <request>
    When I send POST request to /presentation
    Then I get response code 200

    Examples:
      | request                  |
      | { "jwts": "75f1832cbc" } |

