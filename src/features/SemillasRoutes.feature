@didi-server
Feature: Semillas Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Semillas identity validation request
    Given A account <request>
    When I send POST request to /semillas/validateDni
    Then I get response code 200

    Examples:
      | request                                                                                                                                |
      | {"did":"did:ethr:0x184373f25dfe8596395282550853a9d5e1b11160","dni":"40762375", "email": "gaston.genaud@didi.org.ar", "phone": "+542215559612", "name":"Juan", "lastName":"Perez" } |

  Scenario Outline: Request semillas credentials
    Given A token <request>
    When I send POST request to /semillas/notifyDniDid
    Then I get response code 200

    Examples:
      | request                                                                             |
      | { "did": "did:ethr:0x184373f25dfe8596395282550853a9d5e1b11160", "dni": "40762375" } |

  Scenario Outline: Update the status of the identity validation request
    Given A account <request>
    When I send PATCH request to /semillas/identityValidation
    Then I get response code 200 and status success

    Examples:
      | request                                                                               |
      | {"did":"did:ethr:0x184373f25dfe8596395282550853a9d5e1b11160", "state": "IN_PROGRESS"} |


  Scenario Outline: Get identity validation status from Semillas
    Given A account
    When I send GET request to /semillas/identityValidation/:<did>
    Then I get response code 200 and status success

    Examples:
      |did                                                |
      |did:ethr:0x184373f25dfe8596395282550853a9d5e1b11160|

  Scenario Outline: User shares their credentials to the provider to request their service
    Given A account <request>
    When I send POST request to /credentialShare
    Then I get response code 200

    Examples:
      | request                                                                                                                                                                                                          |
      | {"did":"did:ethr:0x184373f25dfe8596395282550853a9d5e1b11160", "email": "gaston.genaud@didi.org.ar", "phone": "+542215559612", "providerId":"20", "viewerJWT":"20", "customProviderEmail":"20", "dni":"40762375"} |

  Scenario Outline: Get the semillas providers
    Given A account
    When I send GET request to /semillas/prestadores
    Then I get response code 200

 Scenario Outline: Remove an identity validation request from Semillas
    Given A account <did>
    When I send DELETE request to /semillas/identityValidation
    Then I get response code 200 and status success

    Examples:
      |did                                                          |
      |{"did":"did:ethr:0x184373f25dfe8596395282550853a9d5e1b11160"}|
