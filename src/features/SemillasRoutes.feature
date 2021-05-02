@didi-server
Feature: Semillas Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Get the semillas providers
    Given A account
    When I send GET request to /semillas/prestadores
    Then I get response code 200

  Scenario Outline: Request semillas credentials
    Given A token <request>
    When I send POST request to /semillas/notifyDniDid
    Then I get response code 200

    Examples:
      | request                                                                             |
      | { "did": "did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc", "dni": "40762726" } |


  Scenario Outline: User shares their credentials to the provider to request their service
    Given A account <request>
    When I send POST request to /credentialShare
    Then I get response code 200

    Examples:
      | request                                                                                                                                                              |
      | {"did":"gaston.genaud@didi.org.ar", "email": "123456aaAA", "phone": "123456aaAA", "providerId":"20", "viewerJWT":"20", "customProviderEmail":"20", "dni":"40762375"} |

  Scenario Outline: Semillas identity validation request
    Given A account <request>
    When I send POST request to /semillas/validateDni
    Then I get response code 200

    Examples:
      | request                                                                                                                                |
      | {"did":"gaston.genaud@didi.org.ar","dni":"40762375", "email": "123456aaAA", "phone": "123456aaAA", "name":"Juan", "lastName":"Perez" } |

  Scenario Outline: Update the status of the identity validation request
    Given A account <request>
    When I send PATCH request to /semillas/identityValidation
    Then I get response code 200

    Examples:
      | request                           |
      | {"did":"did", "state": "Cordoba"} |

 Scenario Outline: Remove an identity validation request from Semillas
    Given A account
    When I send DELETE request to /semillas/identityValidation <did>
    Then I get response code 200

    Examples:
      | did           |
      |  didexample   |

  Scenario Outline: Get identity validation status from Semillas
    Given A account
    When I send GET request to /semillas/identityValidation/: <did>
    Then I get response code 200

    Examples:
      | did                                                    |
      |  did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc   |