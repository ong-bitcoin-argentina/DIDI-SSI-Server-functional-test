@didi-server
Feature: Renaper Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine


  Scenario Outline: Allows to validate the identity of a user against renaper
    Given A token <request>
    When I send POST request to /renaper/validateDni
    Then I get response code 200

    Examples:
      | request                                                                             |
      | { "did":"did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc", "dni":"40852356", "gender": "male", "name": "Juan", "lastName": "Perez", "birthDate": "20/02/1995", "order": "509", "selfieImage": "", "frontImage": "frontImage", "backImage": "backImage"} |


  Scenario Outline: Returns the status of an order placed in "/ validateDni"
    Given A account <request>
    When I send POST request to /renaper/validateDniState
    Then I get response code 200

    Examples:
      | request                                                                                                                                                              |
      | {"did":"gaston.genaud@didi.org.ar", "operationId":"40762375"} |

